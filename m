Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 552E386D6E
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 00:51:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 34AF6C7D;
	Thu,  8 Aug 2019 22:51:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 20E10C6C
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 22:51:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D247814D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 22:51:49 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 81712217F4
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 22:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565304709;
	bh=8Pp17pXv2BsvdUGgrjCA+x6loADEC1HGz0lVc93J0rg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=06U/6nvMdcCkxw7UcbHXLjGLUFy4AtCl3ss9jAZ+s8AHXPinmRTOMcTOo59OHykyz
	NDe7Mf3FCFD0xA2VihjqBz2+9Gzh0S2MrDRCKUqGdaDbpNwQI3cKQrcdKw9UKGcfRT
	oJCXkcagX7UsGQTlExLl2pKFLNyApTCSDnYH2gJ0=
Received: by mail-qk1-f180.google.com with SMTP id 201so70179637qkm.9
	for <virtualization@lists.linux-foundation.org>;
	Thu, 08 Aug 2019 15:51:49 -0700 (PDT)
X-Gm-Message-State: APjAAAV7Ce8AJo4UM63UtcOnqMweX4AEjoteNdV0g1p9kz2YbjbgHT0W
	KhR6rqRvUIAFMQyF3qsdr9FnDGCgV/S9bhUjNA==
X-Google-Smtp-Source: APXvYqwbl/3VPMfI5y3PwG2THnJOA+RM7EdEeptDWTFIwfSk57LM3T+Yd81fZ13xvanJ+3+maiecJE8s+uVIpk4y0kM=
X-Received: by 2002:a37:a48e:: with SMTP id
	n136mr16013485qke.223.1565304708728; 
	Thu, 08 Aug 2019 15:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190808134417.10610-1-kraxel@redhat.com>
	<20190808134417.10610-8-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-8-kraxel@redhat.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Aug 2019 16:51:37 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+rqigmySoJg0iknkEJ5hzWeD3w2iSTpWoqoD67fGV3cw@mail.gmail.com>
Message-ID: <CAL_Jsq+rqigmySoJg0iknkEJ5hzWeD3w2iSTpWoqoD67fGV3cw@mail.gmail.com>
Subject: Re: [PATCH v4 07/17] drm/shmem: drop DEFINE_DRM_GEM_SHMEM_FOPS
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
	<virtualization@lists.linux-foundation.org>,
	Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
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

On Thu, Aug 8, 2019 at 7:44 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> DEFINE_DRM_GEM_SHMEM_FOPS is identical to DEFINE_DRM_GEM_FOPS now,
> drop it.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/drm/drm_gem_shmem_helper.h      | 26 -------------------------
>  drivers/gpu/drm/cirrus/cirrus.c         |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
>  drivers/gpu/drm/v3d/v3d_drv.c           |  2 +-
>  4 files changed, 3 insertions(+), 29 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
