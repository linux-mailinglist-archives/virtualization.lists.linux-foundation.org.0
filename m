Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 21893AB962
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 15:38:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0B3E62328;
	Fri,  6 Sep 2019 13:38:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 53F2F22B8
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:38:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1837A756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:37:32 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DDE183F45
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:37:31 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id b9so2560767wrt.5
	for <virtualization@lists.linux-foundation.org>;
	Fri, 06 Sep 2019 06:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=aanmrrFSrbrC16B1/2djxgOZCrfOygi38gX6T8Hx2OE=;
	b=NXSB/RsyXrNVu20vBXjS4g1swrvxt2h36fjfq7cRhk6Q2O4TmxNODeloUQSxkixLqr
	Jw7sC+42jil/vpTuRvoN5/cQ0QB5GaxwQP+SzeaMDvo8RP3IvFOPlzmERTTEBpykd+9N
	7PvxrbKBxPN3diV2IlI17nZe8/UKJxS8Dpo4qca1MZAoJQxof+N5nLMnuQ2+O6nhRa7t
	8/emRhlGwXjZASzHgZX4X1O1FCGk2Oq9lQf5hslyDec1uATxtEJ1sI833lgukVOvduXs
	I0a8ZEGRkcEqRgBrtH/4d9KBnKgwdV4uWGdHF7jLCKgteGPyTK/VgmsCJ+nA60lU490M
	rpnw==
X-Gm-Message-State: APjAAAUICzlMSAASJ8GlnyBdepKwCaJhAzUwzSwn/0/XbNrQ6jz1s8hd
	s8N00grGrPXm7FcgxaXFhbxziGEYij1ZGodhxv2mzvI1843/Z634gmt80Z8j4U81gwaNSRzMCx8
	2YqFgc0TiJ/dnuCn9L5VIt7lisg4TExOYCnzuumO+9A==
X-Received: by 2002:a5d:5387:: with SMTP id d7mr7529778wrv.312.1567777050244; 
	Fri, 06 Sep 2019 06:37:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrpuonK7IF0vd2h5/N8BnZyiFJnrBEAjQQ2tjZ4s0GtPaJu0RyYzs+POTHYWjLzSnK7iYEuw==
X-Received: by 2002:a5d:5387:: with SMTP id d7mr7529755wrv.312.1567777049914; 
	Fri, 06 Sep 2019 06:37:29 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id k6sm10237535wrg.0.2019.09.06.06.37.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 06:37:29 -0700 (PDT)
Date: Fri, 6 Sep 2019 09:37:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 00/18] virtiofs: Fix various races and cleanups round 1
Message-ID: <20190906093703-mutt-send-email-mst@kernel.org>
References: <20190905194859.16219-1-vgoyal@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190905194859.16219-1-vgoyal@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: miklos@szeredi.hu, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, virtio-fs@redhat.com,
	stefanha@redhat.com, linux-fsdevel@vger.kernel.org, dgilbert@redhat.com
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

On Thu, Sep 05, 2019 at 03:48:41PM -0400, Vivek Goyal wrote:
> Hi,
> 
> Michael Tsirkin pointed out issues w.r.t various locking related TODO
> items and races w.r.t device removal. 
> 
> In this first round of cleanups, I have taken care of most pressing
> issues.
> 
> These patches apply on top of following.
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#virtiofs-v4
> 
> I have tested these patches with mount/umount and device removal using
> qemu monitor. For example.
> 
> virsh qemu-monitor-command --hmp vm9-f28 device_del myvirtiofs
> 
> Now a mounted device can be removed and file system will return errors
> -ENOTCONN and one can unmount it.
> 
> Miklos, if you are fine with the patches, I am fine if you fold these
> all into existing patch. I kept them separate so that review is easier.
> 
> Any feedback or comments are welcome.
> 
> Thanks
> Vivek
> 


Another version of a patch with fixes all rolled in would also
be nice.
> Vivek Goyal (18):
>   virtiofs: Remove request from processing list before calling end
>   virtiofs: Check whether hiprio queue is connected at submission time
>   virtiofs: Pass fsvq instead of vq as parameter to
>     virtio_fs_enqueue_req
>   virtiofs: Check connected state for VQ_REQUEST queue as well
>   Maintain count of in flight requests for VQ_REQUEST queue
>   virtiofs: ->remove should not clean virtiofs fuse devices
>   virtiofs: Stop virtiofs queues when device is being removed
>   virtiofs: Drain all pending requests during ->remove time
>   virtiofs: Add an helper to start all the queues
>   virtiofs: Do not use device managed mem for virtio_fs and virtio_fs_vq
>   virtiofs: stop and drain queues after sending DESTROY
>   virtiofs: Use virtio_fs_free_devs() in error path
>   virtiofs: Do not access virtqueue in request submission path
>   virtiofs: Add a fuse_iqueue operation to put() reference
>   virtiofs: Make virtio_fs object refcounted
>   virtiofs: Use virtio_fs_mutex for races w.r.t ->remove and mount path
>   virtiofs: Remove TODO to quiesce/end_requests
>   virtiofs: Remove TODO item from virtio_fs_free_devs()
> 
>  fs/fuse/fuse_i.h    |   5 +
>  fs/fuse/inode.c     |   6 +
>  fs/fuse/virtio_fs.c | 259 ++++++++++++++++++++++++++++++++------------
>  3 files changed, 198 insertions(+), 72 deletions(-)
> 
> -- 
> 2.20.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
