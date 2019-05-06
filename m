Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEAD1500C
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 17:24:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F25B48C8;
	Mon,  6 May 2019 15:24:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6116B4860
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 15:23:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CD3F987D
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 15:23:24 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id p26so15735535edr.2
	for <virtualization@lists.linux-foundation.org>;
	Mon, 06 May 2019 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=zADYOphlWUk/XuVpyDvL8xXYixf0rcBGFLtrl55FB80=;
	b=PYWIpegdRB644PUglOnsUGSbPX7Msw84SBZSWhLiixKareuwb5TphZnA87qSx1V6p/
	yBkhOZcBJKALHSA5gC5nTuAwMNrhVgaEqO8Ng2wLBJqFzjVwuVUKrxpHM1NCmclhhj20
	7RQTG+vkWWwRrTMmM3UKSnlRgTyqK66U1Dt30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=zADYOphlWUk/XuVpyDvL8xXYixf0rcBGFLtrl55FB80=;
	b=VcvotPikKlI3i9KksFdatRM/9UffpXruJKnSwAEU/Ey7ziAdHd2C6wcwM2UhJuA+jQ
	/ayXMECYTwaGvOa08onw1wtZMx3jdkXEMjQty+A47ICISUBWjsLIxJsaGPhHMCFlvJ5I
	djrNPQigIffjcAABxg/CjAAZLG3g27PWgXw+rcf3Vl8PtUSG6jaJyjUrtasEf+rYB8+2
	VhrkVoZQv8CdfXBTJjFZKl6qmS4CU7BsPhQrUrVQOZwEsSSP8mEZEMw9OAE/MTXXsKP0
	QfMnxoLzMosWavHingrO+OCzOx13awaYlpCtyF9b4ukTa0a3LRRsSdzU7l/R0gv8Axwy
	aadg==
X-Gm-Message-State: APjAAAX3IisFBf3d/cOSU2EDif3QP1C2sVhf5QaPm6R0U2iVE1ibFpxL
	N1535+3mZ2T4NxbBXATeybD6iQ==
X-Google-Smtp-Source: APXvYqzuyrOuARsfniNBtnAaVYiBhW701H0B1RTYw/wAjwzyEl8AtD33Fg2NLEpcRoGxlIjk6FrwpA==
X-Received: by 2002:a50:bae4:: with SMTP id x91mr19865837ede.76.1557156203485; 
	Mon, 06 May 2019 08:23:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id
	d28sm1616637ejl.83.2019.05.06.08.23.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 08:23:22 -0700 (PDT)
Date: Mon, 6 May 2019 17:23:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 00/19] Share TTM code among DRM framebuffer drivers
Message-ID: <20190506152320.GJ17751@phenom.ffwll.local>
References: <20190506082649.942-1-tzimmermann@suse.de>
	<20190506122233.76pya5kpdfgp4f25@sirius.home.kraxel.org>
	<fcb3efd9-64f2-ca35-e36e-83b7055f8055@suse.de>
	<20190506142034.kb3lfvw25xbkrkyq@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506142034.kb3lfvw25xbkrkyq@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: noralf@tronnes.org, Thomas Zimmermann <tzimmermann@suse.de>,
	airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
	kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
	daniel@ffwll.ch, zourongrong@gmail.com, sam@ravnborg.org,
	christian.koenig@amd.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Mon, May 06, 2019 at 04:20:34PM +0200, Gerd Hoffmann wrote:
> On Mon, May 06, 2019 at 03:09:20PM +0200, Thomas Zimmermann wrote:
> > Hi
> > =

> > Am 06.05.19 um 14:22 schrieb Gerd Hoffmann:
> > >> GEM VRAM could implement PRIME helpers, which would allow for using
> > >> the generic fbcon.
> > > =

> > > bochs_gem_prime_*() functions with this series applied look like you =
can
> > > just rename them & move over to vram helpers.
> > > =

> > > It's not a full prime implementation, specifically actual export/impo=
rt
> > > isn't there.  But pin+vmap (needed by generic fbcon) is implemented.
> > =

> > I did have a patch to do this, but then I read that prime requires DMA
> > for buffer sharing and bochs works only because it's emulated.
> =

> For actual buffer sharing with other drivers yes because dma-bufs
> typically are a bunch of pages (struct page**) and live in RAM.
> =

> Not sure whenever it is possible or useful to place the vram in
> ZONE_DEVICE to get page structs for it, then export buffers located
> in vram that way without copying them over to main memory.  I suspect
> most importers would fail to properly setup PCI-PCI dma in that case.

Christian K=F6nig is working on p2p dma-buf sharing. Not sure that's worth
it for virtual devices, but could be fun to wire up I guess.
-Daniel

> =

> > If bochs' implementation is complete enough to be useful for other
> > drivers, I'll add it to the patch set.
> =

> It's good enough for generic fbcon.
> =

> cheers,
>   Gerd
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
