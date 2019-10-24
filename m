Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 69345E318F
	for <lists.virtualization@lfdr.de>; Thu, 24 Oct 2019 13:56:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CAF1A151D;
	Thu, 24 Oct 2019 11:55:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A1E141516
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 11:55:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2F42B14D
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 11:55:51 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g7so2502575wmk.4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=fMCWUrlCZri1tyy5DHaQQhL1mQYk6mcOKGtMSm6ofig=;
	b=WelQ6YKgfVysp9cjI2lEt7r4WRC7RmeWPYzn2UuB2hVHM8EUEtuOsZRsRT79HFqIIz
	oEvDsyJr+T+iwYLfcClbgLgcJpEQIIySj6JbZZTuy5Wo9XcbWNldORZfBj0pkbIw1nKg
	ar51gMC1BMvFyy7OQ+7yC0Z7BqkJVdn1QevLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=fMCWUrlCZri1tyy5DHaQQhL1mQYk6mcOKGtMSm6ofig=;
	b=cSA9/RyMwkCqXrXoYnW3BydAaS6MjROoV8jm4a00Y8blmuxQHfaO1YpPmqHcORzDCz
	oot4gQQvvcc8qzLYNMRfKxOdLB93bK6rcmFdUrEy3fJ4u5A5R8pHaaasyYK907H2s5td
	cX6v2yuN2vEGk74tz9HKYB4I5aiumA1u6g6gchWyBAz6MRCqR0zzxKzsoxLZVS0a6e+2
	nsrVPEh96g0/oKUOYjeK7cPrGqFfwh3p94thmbNlbvfpZZxRtxI9nmFyFKrnijODy876
	XOQ8Dl6Rv4SDy4AupK+dB4Vqezd4AZs+vbMSCTilUVwVwGqHL50Li5/KRxuClcljdqVs
	hvRw==
X-Gm-Message-State: APjAAAXKzO/2croX+TTVIyP09h1ZGnJTJZ0eBJxQbneRYabt8EgkbFqK
	vWm0haQlzGCo9xgnLyySop8exw==
X-Google-Smtp-Source: APXvYqylCae/EuzS65l6wbHAFqm4hgukqcyE28cmZMpidJzZ8iwZnHwIAysao+RlmEvihQzMWUsrBg==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr4450754wmb.77.1571918150317; 
	Thu, 24 Oct 2019 04:55:50 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
	[212.51.149.96]) by smtp.gmail.com with ESMTPSA id
	w9sm18297328wrt.85.2019.10.24.04.55.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 04:55:49 -0700 (PDT)
Date: Thu, 24 Oct 2019 13:55:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/simple-kms: Standardize arguments for callbacks
Message-ID: <20191024115547.GA11828@phenom.ffwll.local>
References: <20191023101256.20509-1-daniel.vetter@ffwll.ch>
	<CACRpkdYfh=9oextiC1rtQ2UQ72OW_0TqjCe4AmvRtXKVv_ZazQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYfh=9oextiC1rtQ2UQ72OW_0TqjCe4AmvRtXKVv_ZazQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	virtualization@lists.linux-foundation.org, Eric Anholt <eric@anholt.net>,
	Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel.vetter@intel.com>,
	Emil Velikov <emil.velikov@collabora.com>
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

On Wed, Oct 23, 2019 at 05:40:32PM +0200, Linus Walleij wrote:
> On Wed, Oct 23, 2019 at 12:13 PM Daniel Vetter <daniel.vetter@ffwll.ch> w=
rote:
> =

> > Passing the wrong type feels icky, everywhere else we use the pipe as
> > the first parameter. Spotted while discussing patches with Thomas
> > Zimmermann.
> >
> > v2: Make xen compile correctly
> >
> > Acked-By: Thomas Zimmermann <tzimmermann@suse.de> (v1)
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: Emil Velikov <emil.velikov@collabora.com>
> > Cc: virtualization@lists.linux-foundation.org
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> =

> Makes perfect sense.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for taking a look, applied.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
