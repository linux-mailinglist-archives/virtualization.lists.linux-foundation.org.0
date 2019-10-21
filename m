Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AC219DEB66
	for <lists.virtualization@lfdr.de>; Mon, 21 Oct 2019 13:52:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2AE1711C4;
	Mon, 21 Oct 2019 11:52:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AA54C11B5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 21 Oct 2019 11:52:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 359E287E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 21 Oct 2019 11:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571658756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=zZBruv/YszCEqmEKFyYzEfKIpa3aLEsFQ2HYxE8iMIs=;
	b=TCC5PlFeYA9g9aEUAMrtWXTGSSyakhBVAah/Wr8aAj6hIJ+gFKsv7ELTv4YdzM0CLY2mMN
	O7lrvoKbP+mbJAbkfSG7FyRnfN4OlWNGABJbGmro1R++buoBmek145NsKpIxApugv3ODKS
	h2rsNtwZT8b0930gPCZil8F8xJYNRn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-290-Hs80mIM2PEaCVtItj_HQzA-1; Mon, 21 Oct 2019 07:52:31 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E4DF80183E;
	Mon, 21 Oct 2019 11:52:30 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14B511001B11;
	Mon, 21 Oct 2019 11:52:25 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 9CB942202E5; Mon, 21 Oct 2019 07:52:24 -0400 (EDT)
Date: Mon, 21 Oct 2019 07:52:24 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH 1/5] virtiofs: Do not end request in submission context
Message-ID: <20191021115224.GA13573@redhat.com>
References: <20191015174626.11593-1-vgoyal@redhat.com>
	<20191015174626.11593-2-vgoyal@redhat.com>
	<CAJfpegtrFvuBUuQ7B+ynCLVmgZ8zRjbUYZYg+BzG6HDmt5RyXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJfpegtrFvuBUuQ7B+ynCLVmgZ8zRjbUYZYg+BzG6HDmt5RyXw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Hs80mIM2PEaCVtItj_HQzA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: chirantan@chromium.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	virtualization@lists.linux-foundation.org, virtio-fs@redhat.com,
	Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org
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

On Mon, Oct 21, 2019 at 10:03:39AM +0200, Miklos Szeredi wrote:

[..]
> >  static void virtio_fs_hiprio_dispatch_work(struct work_struct *work)
> > @@ -502,6 +522,7 @@ static int virtio_fs_setup_vqs(struct virtio_device *vdev,
> >         names[VQ_HIPRIO] = fs->vqs[VQ_HIPRIO].name;
> >         INIT_WORK(&fs->vqs[VQ_HIPRIO].done_work, virtio_fs_hiprio_done_work);
> >         INIT_LIST_HEAD(&fs->vqs[VQ_HIPRIO].queued_reqs);
> > +       INIT_LIST_HEAD(&fs->vqs[VQ_HIPRIO].end_reqs);
> >         INIT_DELAYED_WORK(&fs->vqs[VQ_HIPRIO].dispatch_work,
> >                         virtio_fs_hiprio_dispatch_work);
> >         spin_lock_init(&fs->vqs[VQ_HIPRIO].lock);
> > @@ -511,8 +532,9 @@ static int virtio_fs_setup_vqs(struct virtio_device *vdev,
> >                 spin_lock_init(&fs->vqs[i].lock);
> >                 INIT_WORK(&fs->vqs[i].done_work, virtio_fs_requests_done_work);
> >                 INIT_DELAYED_WORK(&fs->vqs[i].dispatch_work,
> > -                                       virtio_fs_dummy_dispatch_work);
> > +                                 virtio_fs_request_dispatch_work);
> >                 INIT_LIST_HEAD(&fs->vqs[i].queued_reqs);
> > +               INIT_LIST_HEAD(&fs->vqs[i].end_reqs);
> >                 snprintf(fs->vqs[i].name, sizeof(fs->vqs[i].name),
> >                          "requests.%u", i - VQ_REQUEST);
> >                 callbacks[i] = virtio_fs_vq_done;
> > @@ -918,6 +940,7 @@ __releases(fiq->lock)
> >         struct fuse_conn *fc;
> >         struct fuse_req *req;
> >         struct fuse_pqueue *fpq;
> > +       struct virtio_fs_vq *fsvq;
> >         int ret;
> >
> >         WARN_ON(list_empty(&fiq->pending));
> > @@ -951,7 +974,8 @@ __releases(fiq->lock)
> >         smp_mb__after_atomic();
> >
> >  retry:
> > -       ret = virtio_fs_enqueue_req(&fs->vqs[queue_id], req);
> > +       fsvq = &fs->vqs[queue_id];
> > +       ret = virtio_fs_enqueue_req(fsvq, req);
> >         if (ret < 0) {
> >                 if (ret == -ENOMEM || ret == -ENOSPC) {
> >                         /* Virtqueue full. Retry submission */
> > @@ -965,7 +989,13 @@ __releases(fiq->lock)
> >                 clear_bit(FR_SENT, &req->flags);
> >                 list_del_init(&req->list);
> >                 spin_unlock(&fpq->lock);
> > -               fuse_request_end(fc, req);
> > +
> > +               /* Can't end request in submission context. Use a worker */
> > +               spin_lock(&fsvq->lock);
> > +               list_add_tail(&req->list, &fsvq->end_reqs);
> > +               schedule_delayed_work(&fsvq->dispatch_work,
> > +                                     msecs_to_jiffies(1));
> 
> What's the reason to delay by one msec?  If this is purely for
> deadlock avoidance, then a zero delay would work better, no?

Hi Miklos,

I have no good reason to do that. Will change it to zero delay.

Thanks
Vivek

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
