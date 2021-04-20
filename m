Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAF636552F
	for <lists.virtualization@lfdr.de>; Tue, 20 Apr 2021 11:22:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 656A383A8B;
	Tue, 20 Apr 2021 09:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rNj8e5vGmhp; Tue, 20 Apr 2021 09:22:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B09583A91;
	Tue, 20 Apr 2021 09:22:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAF48C000B;
	Tue, 20 Apr 2021 09:22:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E130C000B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 09:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BD904035E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 09:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bT5t7PjrWmQx
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 09:22:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2E164053F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 09:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618910532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fM2Zxq/BIV5zt5mY21HecYUb6ZEHdd7//7NEB7VTkj0=;
 b=HjVRz24XbRgzOVO4dOxdfX2JZT8S7y/V1MTtPC9GCd3sP4RIALLU+agGSbnef1LM5/BKIf
 HDAYaCV471/Np4C0i7fuRD9fGksDSkDWgGaaWzd0MjoZRxbXMhLfsM9I4crrg01anPsz+Q
 9HPbc4108aRuCd8SFaS7xUnKCjy3uFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-pjywwDiHPSCeF_KBFKw-Sw-1; Tue, 20 Apr 2021 05:22:08 -0400
X-MC-Unique: pjywwDiHPSCeF_KBFKw-Sw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E42391020C27;
 Tue, 20 Apr 2021 09:22:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-178.ams2.redhat.com
 [10.36.112.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7751B5C23E;
 Tue, 20 Apr 2021 09:22:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 82A7D1800382; Tue, 20 Apr 2021 11:22:04 +0200 (CEST)
Date: Tue, 20 Apr 2021 11:22:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
Message-ID: <20210420092204.7azdb7nxgofegjht@sirius.home.kraxel.org>
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Rob Herring <robh@kernel.org>, bluescreen_avenger@verizon.net,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 virtualization@lists.linux-foundation.org, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

  Hi,

> > > Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> > > and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> > 
> > .... if support for 8-bit frame buffers would be added?
> 
> Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former
> shouldn't be a big thing, but the latter is only really supported by the
> overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> works, and we keep that illusion up by emulating it in kernel for hw which
> just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> best.

Well.  cirrus converts xrgb8888 on the fly to rgb888 or rgb565
(depending on display resolution).  We could pull off the same trick
here and convert to rgb332 (assuming we can program the palette with the
color cube needed for that).  Wouldn't look pretty, but would probably
work better than expecting userspace know what color palettes are in
2021 ...

take care,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
