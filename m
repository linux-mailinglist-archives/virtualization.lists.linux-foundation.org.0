Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEE4B02C0
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 19:35:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 46451E78;
	Wed, 11 Sep 2019 17:35:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A45D7E56
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 17:35:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6CE4981A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 17:35:27 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id b2so23330770otq.10
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 10:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TEfrk6KvUm4zkJzNEnqhME9vQpfgK19PybX3jXtohZo=;
	b=Ss3lFDmf2x1zmO1RCvXlfUtFdYVJh0kNCj3udMihFRoZiN/GWtF+/4KvyzEQubX/KW
	iBu3xQLy7jsvT6xaWVkJLfsbEL/t5g94+kfe3NqgjagfCJbtbHrjENvnn8uOMcZFuWca
	+zDutqYLaEIojaveCLCcZw7YstXFgG9iDo2/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TEfrk6KvUm4zkJzNEnqhME9vQpfgK19PybX3jXtohZo=;
	b=n0UCkU25mISiPHvPlLgjyRNDj8Np99Cv3wuK9Ltnem3ts8kaqA8lEjaMN3NIx4qHXy
	BN3DvUiG+wOv4YPyq10dHU3rBKEEwdGhiCmaLZToPCmNwAOz+eRm/KjWzuJcEMRx/VKM
	+VapEbBmsxMKaAvvEZrYKS3he8zFvg3NxcHuTK6Go9dZ0ZXWfH8jY3WkZ2RokwkQI4+Y
	MuHfqZoyoMwithfIhGaPz+284S5znRf5H5EOiZpA/jH2wtj2TarRvT87ie/0ifzxzEFa
	1LTrHwdTXbAxAQmw51Yy1JmQBSLRaUOiuyxtSXndcH+nIJUIu/HDG5bMLXfPuT+yRUor
	4WqA==
X-Gm-Message-State: APjAAAUjxa/urmzIeHH9Z3cr4qxTk9WMWCNcVp8W7XtGtNNatTyDPb9k
	xyYK5+IgvE2rKDDSP9ZFuYQNbWxZZo/CuKFQXIb57g==
X-Google-Smtp-Source: APXvYqw3z/39J3ppM7jVmY15tndaCB9Zdaqc203+jWogzJDkjqR8oemXGl5cld6feJSozj9QyZvIBinE9kz+zlDrRX0=
X-Received: by 2002:a9d:6a95:: with SMTP id l21mr4192885otq.127.1568223326279; 
	Wed, 11 Sep 2019 10:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190829212417.257397-1-davidriley@chromium.org>
	<20190910200651.118628-1-davidriley@chromium.org>
	<20190911051240.2k2olzsc3xnqaggl@sirius.home.kraxel.org>
In-Reply-To: <20190911051240.2k2olzsc3xnqaggl@sirius.home.kraxel.org>
From: David Riley <davidriley@chromium.org>
Date: Wed, 11 Sep 2019 10:35:15 -0700
Message-ID: <CAASgrz3rA-i3AjT3UuG7gPTHzdHppNLR3C0j23DEgqxivXtPmg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/virtio: Rewrite virtio_gpu_queue_ctrl_buffer
	using fenced version.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
	virtualization@lists.linux-foundation.org
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

They were based off of  Linus' https://github.com/torvalds/linux
master from yesterday.

I can rebase onto drm-misc-next.

On Tue, Sep 10, 2019 at 10:12 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Sep 10, 2019 at 01:06:50PM -0700, David Riley wrote:
> > Factor function in preparation to generating scatterlist prior to locking.
>
> Patches are looking good now, but they don't apply.  What tree was used
> to create them?
>
> Latest virtio-gpu driver bits are in drm-misc-next (see
> https://cgit.freedesktop.org/drm/drm-misc).
>
> cheers,
>   Gerd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
