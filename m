Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCCEAB9D5
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 15:53:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 48F09234E;
	Fri,  6 Sep 2019 13:52:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9BE16233A
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:52:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B71A5756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:52:54 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B1F17FDFC
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:52:54 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id v16so6346932qtp.14
	for <virtualization@lists.linux-foundation.org>;
	Fri, 06 Sep 2019 06:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=52CdE8+JncbMvzRoKqRhgWDSd6sOQytSaTvTEm45d7g=;
	b=hNrLCyJkqHB4IQvHCQM+vUmsL5gydkoE2L9q0o/wE/mlMqyq+QpoZVU6IgrrjiTXdy
	Vytb5sxlA1Fy59EhegyMQ+nb7aiHj7pfAq22+YMtoPdhgW6s6hCjwj0XxXZPjR0XQJy7
	2VLoMF47GqKkBuK1UUBY5/29i7Rzn7VEJMQ/dUVXM3u5ulXuYpLpew+TOp8QeYmfQdGE
	JELL0vy1/iFEcD1ZGB7lgkRdi+Efb99GXKeBOiJwrhlU6WrmAWYISXepq08w1tV2dZ7v
	gVhcxTz5dWvAzcD5hxHX++6IsYfDZIpmXXz/eRyygs4uCuZWFEZp+oMeqNUAL3gBzqew
	rt4g==
X-Gm-Message-State: APjAAAVGzFJSJmp9Mu91A/WeyfbomJiDTeOCpucT0MwWAGKL/OhhBIIp
	mWXE23D4elaEK8ZCZqWVGQlCWnuZFZqmJ5IJzW1xfPibNs3JUuFdp2CSP4JKuQs5a0TCwetQZES
	3RL0/RVpDU1pzx7+hYewmSGMQNebOARarSYYRxylwSw==
X-Received: by 2002:a37:4dc5:: with SMTP id a188mr9282446qkb.206.1567777973493;
	Fri, 06 Sep 2019 06:52:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5nL7m9gBqvQ6w+E8IFqHc3MzC/N4FmuJLBEZW8gdUYpvWXEr0tbso415mOcImpMKdmdjLqA==
X-Received: by 2002:a37:4dc5:: with SMTP id a188mr9282427qkb.206.1567777973222;
	Fri, 06 Sep 2019 06:52:53 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	c29sm3697800qtc.89.2019.09.06.06.52.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 06:52:52 -0700 (PDT)
Date: Fri, 6 Sep 2019 09:52:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 15/16] virtio-fs: add virtiofs filesystem
Message-ID: <20190906095225-mutt-send-email-mst@kernel.org>
References: <20190903113640.7984-1-mszeredi@redhat.com>
	<20190903114203.8278-10-mszeredi@redhat.com>
	<20190903092222-mutt-send-email-mst@kernel.org>
	<20190905191515.GA11702@redhat.com>
	<20190906102209.GD5900@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906102209.GD5900@stefanha-x1.localdomain>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Miklos Szeredi <mszeredi@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, Vivek Goyal <vgoyal@redhat.com>
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

On Fri, Sep 06, 2019 at 11:22:09AM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 05, 2019 at 03:15:15PM -0400, Vivek Goyal wrote:
> > On Tue, Sep 03, 2019 at 09:55:49AM -0400, Michael S. Tsirkin wrote:
> > [..]
> > > What's with all of the TODOs? Some of these are really scary,
> > > looks like they need to be figured out before this is merged.
> > 
> > Hi Michael,
> > 
> > One of the issue I noticed is races w.r.t device removal and super
> > block initialization. I am about to post a set of patches which
> > take care of these races and also get rid of some of the scary
> > TODOs. Other TODOs like suspend/restore, multiqueue support etc
> > are improvements which we can do over a period of time.
> > 
> > [..]
> > > > +/* Per-virtqueue state */
> > > > +struct virtio_fs_vq {
> > > > +	spinlock_t lock;
> > > > +	struct virtqueue *vq;     /* protected by ->lock */
> > > > +	struct work_struct done_work;
> > > > +	struct list_head queued_reqs;
> > > > +	struct delayed_work dispatch_work;
> > > > +	struct fuse_dev *fud;
> > > > +	bool connected;
> > > > +	long in_flight;
> > > > +	char name[24];
> > > 
> > > I'd keep names somewhere separate as they are not used on data path.
> > 
> > Ok, this sounds like a nice to have. Will take care of this once base
> > patch gets merged.
> > 
> > [..]
> > > > +struct virtio_fs_forget {
> > > > +	struct fuse_in_header ih;
> > > > +	struct fuse_forget_in arg;
> > > 
> > > These structures are all native endian.
> > > 
> > > Passing them to host will make cross-endian setups painful to support,
> > > and hardware implementations impossible.
> > > 
> > > How about converting everything to LE?
> > 
> > So looks like endianness issue is now resolved (going by the other
> > emails). So I will not worry about it.
> > 
> > [..]
> > > > +/* Add a new instance to the list or return -EEXIST if tag name exists*/
> > > > +static int virtio_fs_add_instance(struct virtio_fs *fs)
> > > > +{
> > > > +	struct virtio_fs *fs2;
> > > > +	bool duplicate = false;
> > > > +
> > > > +	mutex_lock(&virtio_fs_mutex);
> > > > +
> > > > +	list_for_each_entry(fs2, &virtio_fs_instances, list) {
> > > > +		if (strcmp(fs->tag, fs2->tag) == 0)
> > > > +			duplicate = true;
> > > > +	}
> > > > +
> > > > +	if (!duplicate)
> > > > +		list_add_tail(&fs->list, &virtio_fs_instances);
> > > 
> > > 
> > > This is O(N^2) as it's presumably called for each istance.
> > > Doesn't scale - please switch to a tree or such.
> > 
> > This is O(N) and not O(N^2) right? Addition of device is O(N), search
> > during mount is O(N).
> > 
> > This is not a frequent event at all and number of virtiofs instances
> > per guest are expected to be fairly small (say less than 10). So I 
> > really don't think there is any value in converting this into a tree
> > (instead of a list).
> > 
> > [..]
> > > > +static void virtio_fs_free_devs(struct virtio_fs *fs)
> > > > +{
> > > > +	unsigned int i;
> > > > +
> > > > +	/* TODO lock */
> > > 
> > > Doesn't inspire confidence, does it?
> > 
> > Agreed. Getting rid of this in set of fixes I am about to post.
> > 
> > > 
> > > > +
> > > > +	for (i = 0; i < fs->nvqs; i++) {
> > > > +		struct virtio_fs_vq *fsvq = &fs->vqs[i];
> > > > +
> > > > +		if (!fsvq->fud)
> > > > +			continue;
> > > > +
> > > > +		flush_work(&fsvq->done_work);
> > > > +		flush_delayed_work(&fsvq->dispatch_work);
> > > > +
> > > > +		/* TODO need to quiesce/end_requests/decrement dev_count */
> > > 
> > > Indeed. Won't this crash if we don't?
> > 
> > Took care of this as well.
> > 
> > [..]
> > > > +static void virtio_fs_hiprio_dispatch_work(struct work_struct *work)
> > > > +{
> > > > +	struct virtio_fs_forget *forget;
> > > > +	struct virtio_fs_vq *fsvq = container_of(work, struct virtio_fs_vq,
> > > > +						 dispatch_work.work);
> > > > +	struct virtqueue *vq = fsvq->vq;
> > > > +	struct scatterlist sg;
> > > > +	struct scatterlist *sgs[] = {&sg};
> > > > +	bool notify;
> > > > +	int ret;
> > > > +
> > > > +	pr_debug("virtio-fs: worker %s called.\n", __func__);
> > > > +	while (1) {
> > > > +		spin_lock(&fsvq->lock);
> > > > +		forget = list_first_entry_or_null(&fsvq->queued_reqs,
> > > > +					struct virtio_fs_forget, list);
> > > > +		if (!forget) {
> > > > +			spin_unlock(&fsvq->lock);
> > > > +			return;
> > > > +		}
> > > > +
> > > > +		list_del(&forget->list);
> > > > +		if (!fsvq->connected) {
> > > > +			spin_unlock(&fsvq->lock);
> > > > +			kfree(forget);
> > > > +			continue;
> > > > +		}
> > > > +
> > > > +		sg_init_one(&sg, forget, sizeof(*forget));
> > > 
> > > This passes to host a structure including "struct list_head list";
> > > 
> > > Not a good idea.
> > 
> > Ok, host does not have to see "struct list_head list". Its needed for
> > guest. Will look into getting rid of this.
> > 
> > > 
> > > 
> > > > +
> > > > +		/* Enqueue the request */
> > > > +		dev_dbg(&vq->vdev->dev, "%s\n", __func__);
> > > > +		ret = virtqueue_add_sgs(vq, sgs, 1, 0, forget, GFP_ATOMIC);
> > > 
> > > 
> > > This is easier as add_outbuf.
> > 
> > Will look into it.
> > 
> > > 
> > > Also - why GFP_ATOMIC?
> > 
> > Hmm..., may be it can be GFP_KERNEL. I don't see atomic context here. Will
> > look into it.
> > 
> > > 
> > > > +		if (ret < 0) {
> > > > +			if (ret == -ENOMEM || ret == -ENOSPC) {
> > > > +				pr_debug("virtio-fs: Could not queue FORGET: err=%d. Will try later\n",
> > > > +					 ret);
> > > > +				list_add_tail(&forget->list,
> > > > +						&fsvq->queued_reqs);
> > > > +				schedule_delayed_work(&fsvq->dispatch_work,
> > > > +						msecs_to_jiffies(1));
> > > 
> > > Can't we we requeue after some buffers get consumed?
> > 
> > That's what dispatch work is doing. It tries to requeue the request after
> > a while.
> > 
> > [..]
> > > > +static int virtio_fs_probe(struct virtio_device *vdev)
> > > > +{
> > > > +	struct virtio_fs *fs;
> > > > +	int ret;
> > > > +
> > > > +	fs = devm_kzalloc(&vdev->dev, sizeof(*fs), GFP_KERNEL);
> > > > +	if (!fs)
> > > > +		return -ENOMEM;
> > > > +	vdev->priv = fs;
> > > > +
> > > > +	ret = virtio_fs_read_tag(vdev, fs);
> > > > +	if (ret < 0)
> > > > +		goto out;
> > > > +
> > > > +	ret = virtio_fs_setup_vqs(vdev, fs);
> > > > +	if (ret < 0)
> > > > +		goto out;
> > > > +
> > > > +	/* TODO vq affinity */
> > > > +	/* TODO populate notifications vq */
> > > 
> > > what's notifications vq?
> > 
> > It has not been implemented yet. At some point of time we want to have
> > a notion of notification queue so that host can send notifications to
> > guest. Will get rid of this comment for now.
> > 
> > [..]
> > > > +#ifdef CONFIG_PM_SLEEP
> > > > +static int virtio_fs_freeze(struct virtio_device *vdev)
> > > > +{
> > > > +	return 0; /* TODO */
> > > > +}
> > > > +
> > > > +static int virtio_fs_restore(struct virtio_device *vdev)
> > > > +{
> > > > +	return 0; /* TODO */
> > > > +}
> > > 
> > > Is this really a good idea? I'd rather it was implemented,
> > > but if not possible at all disabling PM seems better than just
> > > keep going.
> > 
> > I agree. Will look into disabling it.
> > 
> > > 
> > > > +#endif /* CONFIG_PM_SLEEP */
> > > > +
> > > > +const static struct virtio_device_id id_table[] = {
> > > > +	{ VIRTIO_ID_FS, VIRTIO_DEV_ANY_ID },
> > > > +	{},
> > > > +};
> > > > +
> > > > +const static unsigned int feature_table[] = {};
> > > > +
> > > > +static struct virtio_driver virtio_fs_driver = {
> > > > +	.driver.name		= KBUILD_MODNAME,
> > > > +	.driver.owner		= THIS_MODULE,
> > > > +	.id_table		= id_table,
> > > > +	.feature_table		= feature_table,
> > > > +	.feature_table_size	= ARRAY_SIZE(feature_table),
> > > > +	/* TODO validate config_get != NULL */
> > > 
> > > Why?
> > 
> > Don't know. Stefan, do you remember why did you put this comment? If not,
> > I will get rid of it.
> 
> This comment can be removed.
> 
> > > > +static void virtio_fs_wake_pending_and_unlock(struct fuse_iqueue *fiq)
> > > > +__releases(fiq->waitq.lock)
> > > > +{
> > > > +	unsigned int queue_id = VQ_REQUEST; /* TODO multiqueue */
> > > > +	struct virtio_fs *fs;
> > > > +	struct fuse_conn *fc;
> > > > +	struct fuse_req *req;
> > > > +	struct fuse_pqueue *fpq;
> > > > +	int ret;
> > > > +
> > > > +	WARN_ON(list_empty(&fiq->pending));
> > > > +	req = list_last_entry(&fiq->pending, struct fuse_req, list);
> > > > +	clear_bit(FR_PENDING, &req->flags);
> > > > +	list_del_init(&req->list);
> > > > +	WARN_ON(!list_empty(&fiq->pending));
> > > > +	spin_unlock(&fiq->waitq.lock);
> > > > +
> > > > +	fs = fiq->priv;
> > > > +	fc = fs->vqs[queue_id].fud->fc;
> > > > +
> > > > +	dev_dbg(&fs->vqs[queue_id].vq->vdev->dev,
> > > > +		"%s: opcode %u unique %#llx nodeid %#llx in.len %u out.len %u\n",
> > > > +		__func__, req->in.h.opcode, req->in.h.unique, req->in.h.nodeid,
> > > > +		req->in.h.len, fuse_len_args(req->out.numargs, req->out.args));
> > > > +
> > > > +	fpq = &fs->vqs[queue_id].fud->pq;
> > > > +	spin_lock(&fpq->lock);
> > > > +	if (!fpq->connected) {
> > > > +		spin_unlock(&fpq->lock);
> > > > +		req->out.h.error = -ENODEV;
> > > > +		pr_err("virtio-fs: %s disconnected\n", __func__);
> > > > +		fuse_request_end(fc, req);
> > > > +		return;
> > > > +	}
> > > > +	list_add_tail(&req->list, fpq->processing);
> > > > +	spin_unlock(&fpq->lock);
> > > > +	set_bit(FR_SENT, &req->flags);
> > > > +	/* matches barrier in request_wait_answer() */
> > > > +	smp_mb__after_atomic();
> > > > +	/* TODO check for FR_INTERRUPTED? */
> > > 
> > > 
> > > ?
> > 
> > hmm... we don't support FR_INTERRUPTED. Stefan, do you remember why
> > this TODO is here. If not, I will get rid of it.
> 
> We don't support FUSE_INTERRUPT yet.  The purpose of this comment is
> that when we do support FUSE_INTERRUPT we'll need to follow
> fuse_dev_do_read() in queuing a FUSE_INTERRUPT here.
> 
> Stefan



OK so pls write this explicitly in the comment.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
