Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA5DA6B1D
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 16:19:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 55F7BCBB;
	Tue,  3 Sep 2019 14:19:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5C3EEC37
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 14:19:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 16F808A8
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 14:19:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87477302C060;
	Tue,  3 Sep 2019 14:19:00 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.226])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E858060CCE;
	Tue,  3 Sep 2019 14:18:51 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 762BB220292; Tue,  3 Sep 2019 10:18:51 -0400 (EDT)
Date: Tue, 3 Sep 2019 10:18:51 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 00/13] virtio-fs: shared file system for virtual
	machines
Message-ID: <20190903141851.GC10983@redhat.com>
References: <20190821173742.24574-1-vgoyal@redhat.com>
	<CAJfpegvPTxkaNhXWhiQSprSJqyW1cLXeZEz6x_f0PxCd-yzHQg@mail.gmail.com>
	<20190903041507-mutt-send-email-mst@kernel.org>
	<20190903140752.GA10983@redhat.com>
	<20190903101001-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903101001-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 03 Sep 2019 14:19:00 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, virtio-fs@redhat.com,
	Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
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

On Tue, Sep 03, 2019 at 10:12:16AM -0400, Michael S. Tsirkin wrote:
> On Tue, Sep 03, 2019 at 10:07:52AM -0400, Vivek Goyal wrote:
> > On Tue, Sep 03, 2019 at 04:31:38AM -0400, Michael S. Tsirkin wrote:
> > 
> > [..]
> > > +	/* TODO lock */
> > > give me pause.
> > > 
> > > Cleanup generally seems broken to me - what pauses the FS
> > 
> > I am looking into device removal aspect of it now. Thinking of adding
> > a reference count to virtiofs device and possibly also a bit flag to
> > indicate if device is still alive. That way, we should be able to cleanup
> > device more gracefully.
> 
> Generally, the way to cleanup things is to first disconnect device from
> linux so linux won't send new requests, wait for old ones to finish.

I was thinking of following.

- Set a flag on device to indicate device is dead and not queue new
  requests. Device removal call can set this flag.

- Return errors when fs code tries to queue new request.

- Drop device creation reference in device removal path. If device is
  mounted at the time of removal, that reference will still be active
  and device state will not be cleaned up in kernel yet.

- User unmounts the fs, and that will drop last reference to device and
  will lead to cleanup of in kernel state of the device.

Does that sound reasonable.

Vivek
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
