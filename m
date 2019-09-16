Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C34EEB43C3
	for <lists.virtualization@lfdr.de>; Tue, 17 Sep 2019 00:07:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5D2F31409;
	Mon, 16 Sep 2019 22:07:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0910C13F1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 16 Sep 2019 22:07:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0EABA70D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 16 Sep 2019 22:07:27 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AAAAF218AC
	for <virtualization@lists.linux-foundation.org>;
	Mon, 16 Sep 2019 22:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568671646;
	bh=dOmx+5b6FQTG2S2CZB6xwqvYvyES1DQ1DZe+OAaMClg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vqktAQYAqdZQgDA2CtTybSuSETpsBWt7QdjYS1Ul6ZH2Zqd4TNkLn2pHNuNvPk/Vt
	4tJIsivFm0ZeY014fO1zUv9DeJY9X03hJAY8KY4lKExIcQtByGyCi6qUSYdoEUP7I+
	kMzmbws2N/zLBMqRsNuZ8b864lBbNVokNah0F+Vk=
Received: by mail-qk1-f177.google.com with SMTP id 201so1623314qkd.13
	for <virtualization@lists.linux-foundation.org>;
	Mon, 16 Sep 2019 15:07:26 -0700 (PDT)
X-Gm-Message-State: APjAAAXxhTtsKxs9HoBzUoZ/9In/2qNVFvTATnj9m8kTY1KUKi33ISI7
	MthN1wrGLdyTxUZTIw3s+n4JjWEnqcNjY95uzg==
X-Google-Smtp-Source: APXvYqw0JdhpCWLexwIOT8ESTlHEFkeSnb9jRER69EJErTdTZGBlE/PDwDE/PA78bdeKSSrQ0wdFLVGRQB2aD4rqikg=
X-Received: by 2002:a05:620a:549:: with SMTP id
	o9mr575224qko.223.1568671645784; 
	Mon, 16 Sep 2019 15:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190913122908.784-1-kraxel@redhat.com>
	<20190913122908.784-4-kraxel@redhat.com>
In-Reply-To: <20190913122908.784-4-kraxel@redhat.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Sep 2019 17:07:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJajCtM=vRgSDX2DQ6iJzDgMHicXgXgGqF7Bc-KdTUUQA@mail.gmail.com>
Message-ID: <CAL_JsqJajCtM=vRgSDX2DQ6iJzDgMHicXgXgGqF7Bc-KdTUUQA@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/shmem: drop DEFINE_DRM_GEM_SHMEM_FOPS
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Steven Price <steven.price@arm.com>, Hans de Goede <hdegoede@redhat.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
	"open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
	<virtualization@lists.linux-foundation.org>, Sean Paul <sean@poorly.run>
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

On Fri, Sep 13, 2019 at 7:29 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>

Version? Pretty sure this is not v1.

> DEFINE_DRM_GEM_SHMEM_FOPS is identical
> to DEFINE_DRM_GEM_FOPS now, drop it.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/drm/drm_gem_shmem_helper.h      | 26 -------------------------
>  drivers/gpu/drm/cirrus/cirrus.c         |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
>  drivers/gpu/drm/tiny/gm12u320.c         |  2 +-
>  drivers/gpu/drm/v3d/v3d_drv.c           |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c    |  2 +-
>  6 files changed, 5 insertions(+), 31 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
