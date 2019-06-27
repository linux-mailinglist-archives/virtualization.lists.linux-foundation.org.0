Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD8357B4B
	for <lists.virtualization@lfdr.de>; Thu, 27 Jun 2019 07:24:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BE395CD1;
	Thu, 27 Jun 2019 05:24:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 30AC7CA6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 05:24:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C454C3D0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 05:24:33 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h6so2028195ioh.3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 22:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RIIwBX17xBmvmx1T+gcoOewCXOkdROxcqv1U8Dyz+oE=;
	b=OXZlLx/GhXOXqwsTB/C1LqW8uw0P35vMVrRjeFdl6kaABAlVKJvCh2sz/FruA5C2Ex
	CtdRjmzFIXxVXhTzYkM/TiPllk8gHaNR1ycXdrEV/HQQmkr97fic5QH1H4t3Q456NpnU
	JbbXYMBtrduGC7PuVPp3LcoQr3DU/6GGdkDRsKBpU7S/KRv8UoNS6g1TKxZnLy/axGJL
	BSL6szx5l6pkpSP5nwqNBrLHHlKBHAKbqR9Ja/f2lW4N4d/J2d1D4vlfWEAQiKHOJdiD
	QgO/LrKA+u3P49TJ18ExP908RZkdxXyz3LK7w/unBJsIs088mPd+25gXOsuF7AP0zguE
	1oDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RIIwBX17xBmvmx1T+gcoOewCXOkdROxcqv1U8Dyz+oE=;
	b=LX2g+Uohv48r3MGAcpnG/0bPhrmEGnCrcQJ7Dg/hxCUpy7WsVK4XZ/jZrJKIGx6Ve6
	rE479dCqRBGDCQC9zKgv1PQ1XLHeyF3cddybehjVdrOBSYCN/hnvOCUN9OfV2uvoth6a
	GCPbqwAhPnpOIUjEDD66o3UghIZ1JUfdc4vE6M5WkqJZPE/TPWk5+bSMUa2lvocJix3I
	7qwvW9gywBS/O/liE/u8YdybovZbFnh74cQ0Xhe+yqeiquiRZ0/qbyB1FwEduNkKLprq
	SrLZb6J9CYddzyJJ+oCW7p8/35IJXVpLeiMXAHlsCPRlLTaKpGH4BQdJG6mY4KZ9Bk/z
	Cdyg==
X-Gm-Message-State: APjAAAXlHLH8OJBIez+r69Ldpp/XbtSqiG/KC8ktseQ/T5NtxlMrWGcM
	cw93OtPAZMJCuQwEGMHIyMRkVVGITyygCi9I7PU=
X-Google-Smtp-Source: APXvYqzbfviqVNtJkE4LqaJax/YS9ZYRuR9tvoYRDCBiYHH3Lad0CksUqVzpaEfSLY8jg9WXf01iJSJx5T6KnqYmSdw=
X-Received: by 2002:a5d:97d8:: with SMTP id k24mr2531140ios.84.1561613072925; 
	Wed, 26 Jun 2019 22:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190619090420.6667-1-kraxel@redhat.com>
	<20190619090420.6667-9-kraxel@redhat.com>
	<20190619110902.GO12905@phenom.ffwll.local>
	<20190620060107.tdz3nrnsczkkv2a6@sirius.home.kraxel.org>
In-Reply-To: <20190620060107.tdz3nrnsczkkv2a6@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 26 Jun 2019 22:24:20 -0700
Message-ID: <CAPaKu7SZr+wvoM8JgB=d4kHOJioPiG-hQbfU5mmT4iB9Kn4DgA@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] drm/virtio: rework virtio_gpu_execbuffer_ioctl
	fencing
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
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

I tried my best to review this series.  I am not really a kernel dev
so please take that with a grain of salt.

On Wed, Jun 19, 2019 at 11:01 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > Also, I strongly recommend you do a very basic igt to exercise this, i.e.
> > allocate some buffers, submit them in a dummby op, then close the entire
> > drmfd. The old version should at least have tripped over kasan, maybe even
> > oopses somewhere.
>
> Hmm, I suspect I have to extend igt for that (adding support for
> virtio ioctls), right?
>
> A quick and dirty test (run webgl demo in firefox, then kill -9 both
> firefox and Xorg) didn't show any nasty surprises.
>
> cheers,
>   Gerd
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
