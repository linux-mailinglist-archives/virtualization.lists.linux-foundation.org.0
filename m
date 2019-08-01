Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 343D07DAC0
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 13:57:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3548D88D9;
	Thu,  1 Aug 2019 11:57:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 44C11AFF5
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 11:38:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 41FE082B
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 11:38:31 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id j19so35398170otq.2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 01 Aug 2019 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=inqwfRmfEk+ixkWc1er0351Xu7C3pd72Cp90CBeM7pw=;
	b=d6Kk6kJbHp2hIOHmyLPIfNtxKsYZ09pHZKaPc/eFEm+ZJIA5hS4XLji6HN044L5xhN
	Wopvvth//rw9L7xLdXGIQlw/rWlQNF/b+O3ntF+MtFjwoAAcXoE7KIJHfWGRCsRR6YJE
	PRjMOWMH1sVjVbUbOX5bWNUlW6g+iB6plCdYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=inqwfRmfEk+ixkWc1er0351Xu7C3pd72Cp90CBeM7pw=;
	b=RHlfCWLYXA1g1NoEWSmthEd6VOWUBn/3iyJBemXc1gV7VR/52c/cqs4t7SS7C0rC7v
	WxOpOKfwRQNFu3DdwbISqQVxg5wb8XnxFdmRvXJ6C157Im+pM2lF1YfhpWtBDukm9Xnh
	fwnhTOktroJNSlHtcHYonl0nCOBc7e9wfST2QjmcTnOmh7neKVjssFPmP7EcqEevaZf8
	WMpdABSYMjxf3EwkNhujYTspxTO60OldM7uzcdRYheJp1wCx3cpDKywdU4V8SITxnyAc
	d+7WWuj2orrZXeJd1mMtlR3nmRBGcqX1cwTA9yKbFUDyGsyJW4C/Od3IVIO7hD/c+szB
	5/vA==
X-Gm-Message-State: APjAAAUahsT7o1y/t7RPgexqER9yjL9XEheTo1446M8d3vUu2mUtGp5N
	VGh0WpH8EXWiDlJjWuPZdBazgoTDqzMmzMfG7XM=
X-Google-Smtp-Source: APXvYqyZRZjHvndeR3WlGPmFUAiu4bkGDxPS56T0MOFfbaKeaxR1K2a+EmKAeMlice9p7Y5Wwiv/7S45R1xkix5IUzw=
X-Received: by 2002:a9d:590d:: with SMTP id t13mr13137003oth.281.1564659510526;
	Thu, 01 Aug 2019 04:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190705092613.7621-1-tzimmermann@suse.de>
	<20190801070452.wi3xxu22kq2vxovp@sirius.home.kraxel.org>
In-Reply-To: <20190801070452.wi3xxu22kq2vxovp@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 1 Aug 2019 13:38:18 +0200
Message-ID: <CAKMK7uFTYJxF_JHwRjAN_nV=OCuFtx376H_7ku2H_0S-r9nRPg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Unmappable DRM client buffers for fbdev emulation
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
	NET..." <virtualization@lists.linux-foundation.org>,
	=?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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

On Thu, Aug 1, 2019 at 9:04 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > and removes a large amount of framebuffer code from these drivers. For
> > bochs, a problem was reported where the driver could not display the console
> > because it was pinned in system memory. [1] The patch set fixes this bug
> > by converting bochs to use the shadow fb.
>
> So, bochs in 5.3-rcX is broken, and patches 1+2+3+5 of this series unbreak
> it.  Series already landed in drm-misc-next, but that doesn't help bochs
> in 5.3.
>
> What is the usual way to handle this?
> Just cherry-pick the four patches into drm-misc-fixes and push?

Best would be to put the patches into -fixes from the start. Cherry
pick works too, if it's not too invasive. Otherwise revert in -fixes,
and remember to not carry that revert over when backmerging.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
