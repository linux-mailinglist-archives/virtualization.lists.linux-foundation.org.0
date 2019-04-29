Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AF2E569
	for <lists.virtualization@lfdr.de>; Mon, 29 Apr 2019 16:52:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 633C72202;
	Mon, 29 Apr 2019 14:46:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ED6BC21D6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:44:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 87CE971C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:44:53 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id w15so16764763itc.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1XMGdoAytJZYLIEjS5YuwMYRgJWQI6ikHtyLu0eBdrg=;
	b=ebLoXPCvsVtjVKlYnuDaoE/vTcZEjFgtCNZy/GJ9RM7CqdGpbdNpyJ/MGlHiTn8mwU
	cNsqm35xFbA0XbkywCTWXXW+87WMdZDdAr99EbknWBCCfipowQkXrsgbO/O6/TKeHRKm
	YCZ4hxNICRW4XSQ9d5gCdAf72YEQsAM9IZEJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1XMGdoAytJZYLIEjS5YuwMYRgJWQI6ikHtyLu0eBdrg=;
	b=DQCm3WcGTwDgMsZAzclA3pZWcbIe6GP4sLMexh1QaO+4mb75p4aADiqnp6Fn0uGiy8
	JroWT58UtqYRoyqRmoU2f8lcMVn1DKKGEjKKv8M6sLzDTdw/yBojpjUYJeMLMlF2Imri
	KWoJbDlsms+pDxL7Z2vJUZKUzAdPCsugJGiR+5eEMpXWt+AaNyzY53I6O3AAjaV7qyxp
	oMiKeQZJleiliW1t3pDThqo7/cdwSddvqxv8fIirmedncNU5LJg27SnqfJEQIx077FdA
	F+W6HyTESghxlPia/2EII62UFDHCRLRMWqWMX0d0gbAVmTL5peRvDb0pN9UqidnbztJA
	E35w==
X-Gm-Message-State: APjAAAVmXnkL9kHk2GKAv1Wh7UpuMYU0kQO38cZAbcCI+ewPPq5Ei15o
	7uMWtJTWYjFDAtt2tJi5265HEN+A/3Qgk3neFtWaiQ==
X-Google-Smtp-Source: APXvYqyC+k0ZQbGHt6LZUZL+iV+YTOgPi+kmdEsi7UKxu3MuNzurrBR7OzXmdy7mQ47RnHA3m349CFEdQv66aJzM/2c=
X-Received: by 2002:a24:6f48:: with SMTP id x69mr5454748itb.117.1556549092746; 
	Mon, 29 Apr 2019 07:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190426053324.26443-1-kraxel@redhat.com>
	<CAKMK7uG+vMU0hqqiKAswu=LqpkcXtLPqbYLRWgoAPpsQQV4qzA@mail.gmail.com>
	<20190429075413.smcocftjd2viznhv@sirius.home.kraxel.org>
	<CAKMK7uFB8deXDMP9cT634p_dK5LsM37R1v_vGhAEY1ZLZ+WBVA@mail.gmail.com>
	<20190429143757.yljjfsgobhi23xnb@sirius.home.kraxel.org>
In-Reply-To: <20190429143757.yljjfsgobhi23xnb@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 29 Apr 2019 16:44:40 +0200
Message-ID: <CAKMK7uE_+-pFuVrqznj9ZbRxwyNM9mRhoY-y4xCBjjY9Z-sNDg@mail.gmail.com>
Subject: Re: [Spice-devel] [PATCH] Revert "drm/qxl: drop prime import/export
	callbacks"
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>, David Airlie <airlied@redhat.com>
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

On Mon, Apr 29, 2019 at 4:38 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > More useful would be some way to signal this self-reimport capability
> > > to userspace somehow.  See DRM_PRIME_CAP_LOCAL patch.
> >
> > Userspace is supposed to test whether import/export works for a
> > specific combo, not blindly assume it does and then keel over. I think
> > we need to fix that, not add more flags - there's lots of reasons why
> > a given pair of devices can't share buffers (e.g. all the contiguous
> > allocations stuff on socs).
>
> Ok.  Lets scratch the DRM_PRIME_CAP_LOCAL idea then and blame userspace
> instead.
>
> > > Right now I have the choice to set DRM_PRIME_CAP_{IMPORT,EXPORT}, in
> > > which case some userspace assumes it can do cross-driver export/import
> > > and trips over that not working.  Or I do not set
> > > DRM_PRIME_CAP_{IMPORT,EXPORT}, which breaks DRI3 ...
> >
> > Yeah that's not an option.
>
> Good.  Can I get an ack for this patch then, as it unbreaks DRI3 with qxl?

Oh sure, acked-by: me. Sorry forgot to supply that ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
