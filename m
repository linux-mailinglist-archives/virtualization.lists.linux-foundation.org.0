Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA0C5FD63
	for <lists.virtualization@lfdr.de>; Thu,  4 Jul 2019 21:18:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5C7FBDA8;
	Thu,  4 Jul 2019 19:18:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9EF859D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 19:18:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4404687B
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 19:18:00 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id e5so10249543iok.4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 04 Jul 2019 12:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LCuBLDKrofsuoqhEiEo5+1hJatvhFnFN7oOLzAEnyM4=;
	b=bhvxBO8QMlxGiuh/BsyudtWPQFUjQ5R9CUOpdTYaaqZyQ8vlvu/++aMUwi7JPKLthb
	TUMk35QeF5dolWl0Sim+RKa834/lE/WsTIuTlbDF0ehQm3t97BMJEahLPFrS4EXBmrvQ
	hGtjekw2DVmTrMgyT5cq43Ydrv1tI2BXhhH3cd0rbshvREhTgk+eN0E0HZlra+7rkBII
	JQEe1bSGSfbPaEhX75Miqqh4xtrQ3u9LzWU9zuiHUi3vu+v8zyPfDbrkdvRsfhQjXdI5
	jVqTZNVX15sFR7jJRcTntloFNUV9B9Y1sW8SJF4UfOj7XMQDbr6QIZ47Tbbb+X1jaXSp
	4BDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LCuBLDKrofsuoqhEiEo5+1hJatvhFnFN7oOLzAEnyM4=;
	b=nWkT4Z6siiJb2deyLkCKGSUrejOyiy+roRaiiySIkdbgqWIxp/h8MXh78Lmq6kg2QK
	bFe6/s9B679WjnqvSZW+DstEHHggDPhynsL9LUttLUnutoFCw1LVr7JQh38B/HOi0H5K
	6ZzsUR3ZTSShkma7gCuj75tsmxga0I9gFxM0LEMEmQCk49x7Mr1O60SA+O+NF1E3Gf3V
	hhqKiz2RgcPG61wbKJro2PJEFFyHlBYp/ytidxcXPqxEN1OJR1Du4c3EQtozgbzl8QEO
	qoSZ2fn7B8ad6kk0HgA6jqJJcAcKH5niMWIHEWowmODeCUYMbOB/dsIp59lD1pN5TfHB
	Fdsw==
X-Gm-Message-State: APjAAAWCJJw62pX1o+BPzgNnOIknvu0iLCbv0sPD23XIgNhy3EQWE8v2
	PqYmMW9PtUBDNxcd8s0vDVE+mJzvUNjEZZjbKOU=
X-Google-Smtp-Source: APXvYqwsruAsuCOPhI8PglL1hWlvCc+IVuPwdgdoadncDMpAGwAlFk4w01GWSPGzZlwU1IUEHNzB3abapsoIEw3vMZY=
X-Received: by 2002:a6b:6012:: with SMTP id r18mr5966278iog.241.1562267879466; 
	Thu, 04 Jul 2019 12:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-7-kraxel@redhat.com>
	<CAPaKu7RfLoB=K__wQd92=S20Mt0uqsfyU9oigr8CQ-=gH6OUuA@mail.gmail.com>
	<20190704111043.5ubc2yjrjphj2iec@sirius.home.kraxel.org>
In-Reply-To: <20190704111043.5ubc2yjrjphj2iec@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Jul 2019 12:17:48 -0700
Message-ID: <CAPaKu7S4Og7kda2ZjFtuRv=_W8gpFbD5y7s==0JB5Z34S4Hsjw@mail.gmail.com>
Subject: Re: [PATCH v6 06/18] drm/virtio: remove ttm calls from in
	virtio_gpu_object_{reserve, unreserve}
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Gurchetan Singh <gurchetansingh@chromium.org>
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

On Thu, Jul 4, 2019 at 4:10 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > -       r = ttm_bo_reserve(&bo->tbo, true, false, NULL);
> > > +       r = reservation_object_lock_interruptible(bo->gem_base.resv, NULL);
> > Can you elaborate a bit about how TTM keeps the BOs alive in, for
> > example, virtio_gpu_transfer_from_host_ioctl?  In that function, only
> > three TTM functions are called: ttm_bo_reserve, ttm_bo_validate, and
> > ttm_bo_unreserve.  I am curious how they keep the BO alive.
>
> It can't go away between reserve and unreserve, and I think it also
> can't be evicted then.  Havn't checked how ttm implements that.
Hm, but the vbuf using the BO outlives the reserve/unreserve section.
The NO_EVICT flag applies only when the BO is still alive.  Someone
needs to hold a reference to the BO to keep it alive, otherwise the BO
can go away before the vbuf is retired.

I can be wrong, but on the other hand, it seems fine for a BO to go
away before the vbuf using it is retired.  When that happens, the
driver emits a RESOURCE_UNREF vbuf which is *after* the original vbuf.


>
> cheers,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
