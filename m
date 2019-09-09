Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A73C6ADC30
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 17:35:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E65DDB50;
	Mon,  9 Sep 2019 15:35:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2DDF5B50
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 15:35:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C8F6882B
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 15:35:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 066883090FEE;
	Mon,  9 Sep 2019 15:35:47 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.137])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4FC6A5D6B2;
	Mon,  9 Sep 2019 15:35:38 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id CA111220292; Mon,  9 Sep 2019 11:35:37 -0400 (EDT)
Date: Mon, 9 Sep 2019 11:35:37 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: piaojun <piaojun@huawei.com>
Subject: Re: [Virtio-fs] [PATCH 15/18] virtiofs: Make virtio_fs object
	refcounted
Message-ID: <20190909153537.GA25501@redhat.com>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-16-vgoyal@redhat.com>
	<a8ddb168-5fdb-b35a-5357-3c75e0226049@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8ddb168-5fdb-b35a-5357-3c75e0226049@huawei.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 09 Sep 2019 15:35:47 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: miklos@szeredi.hu, mst@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, virtio-fs@redhat.com,
	linux-fsdevel@vger.kernel.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Sun, Sep 08, 2019 at 07:10:03PM +0800, piaojun wrote:
> 
> 
> On 2019/9/6 3:48, Vivek Goyal wrote:
> > This object is used both by fuse_connection as well virt device. So make
> > this object reference counted and that makes it easy to define life cycle
> > of the object.
> > 
> > Now deivce can be removed while filesystem is still mounted. This will
> > cleanup all the virtqueues but virtio_fs object will still be around and
> > will be cleaned when filesystem is unmounted and sb/fc drops its reference.
> > 
> > Removing a device also stops all virt queues and any new reuqest gets
> > error -ENOTCONN. All existing in flight requests are drained before
> > ->remove returns.
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  fs/fuse/virtio_fs.c | 52 +++++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 43 insertions(+), 9 deletions(-)
> > 
> > diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> > index 01bbf2c0e144..29ec2f5bbbe2 100644
> > --- a/fs/fuse/virtio_fs.c
> > +++ b/fs/fuse/virtio_fs.c
> > @@ -37,6 +37,7 @@ struct virtio_fs_vq {
> >  
> >  /* A virtio-fs device instance */
> >  struct virtio_fs {
> > +	struct kref refcount;
> >  	struct list_head list;    /* on virtio_fs_instances */
> >  	char *tag;
> >  	struct virtio_fs_vq *vqs;
> > @@ -63,6 +64,27 @@ static inline struct fuse_pqueue *vq_to_fpq(struct virtqueue *vq)
> >  	return &vq_to_fsvq(vq)->fud->pq;
> >  }
> >  
> > +static void release_virtiofs_obj(struct kref *ref)
> > +{
> > +	struct virtio_fs *vfs = container_of(ref, struct virtio_fs, refcount);
> > +
> > +	kfree(vfs->vqs);
> > +	kfree(vfs);
> > +}
> > +
> > +static void virtio_fs_put(struct virtio_fs *fs)
> > +{
> > +	mutex_lock(&virtio_fs_mutex);
> > +	kref_put(&fs->refcount, release_virtiofs_obj);
> > +	mutex_unlock(&virtio_fs_mutex);
> > +}
> > +
> > +static void virtio_fs_put(struct fuse_iqueue *fiq)
> > +{
> > +	struct virtio_fs *vfs = fiq->priv;
> > +	virtiofs_put(vfs);
> > +}
> 
> It's a little confusing that virtiofs_put() looks like virtiofs_put(),
> and could we use __virtio_fs_put to replace virtio_fs_put?

Fixed this in follow up patch I posted.

https://www.redhat.com/archives/virtio-fs/2019-September/msg00091.html

Vivek
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
