Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9DDD4E
	for <lists.virtualization@lfdr.de>; Mon, 29 Apr 2019 10:00:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 36DDD1E88;
	Mon, 29 Apr 2019 08:00:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2A2F91E5B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 07:58:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AC426608
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 07:58:27 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id q14so14942924itk.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UeOi90RYK8x7ozYD+9mGxr1il4jAoIstt7bREKCu3cA=;
	b=D8ZGXuNPj9TpGPOtq1s2SfKPo8/hGGiu/RdCPTwWh9MfYk3OL8KyrOZNnRvCz92Rb2
	d0PMJUqsi8lwo6mK4r6I+8T+rcP2qoGPi52PcZkxlJ3J4OwpJ9igf36ba1TNmUPvpj5b
	QhnTTh0tqGm70lA32HYjSGl8FLFMHP2IhsoxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UeOi90RYK8x7ozYD+9mGxr1il4jAoIstt7bREKCu3cA=;
	b=i5ZFhhyTYWK+N8H0mbSB8dglktiqegnMB1EeO73diqyVC6KxvCGTI690f4uLjXd7uy
	TyNyfzd9YYZ4lpec3JNSsJcwPrk4WJ7cmSm2g69lkSA/EOkY9k5lFsgCtJzzca4BGdIP
	A2cZD1jORULrwSsvA8ZkuJ2LnNb9PotrTcGoAA/9am1QyJ62YR0/r5YDCunMjqlaRB5b
	opkOR5VY7AfdAGObq/Z2iReBEEMIXGl3+tqaUsAmSnz0lDzEOtPteAXEMjP2E+g24t9p
	FL1cdWeyIMi9eTjg7lSljMOnMIY75J06IiRwiroiBVLxonXo41xSUYBcDhZQffYGYOhg
	MA6g==
X-Gm-Message-State: APjAAAVD9/V4btNM+9HQI9uoLnubWw/LpnC8uuGxO09OeRGgO9Q6c/Yi
	VdJ36LIrxeEHGUau9le/OqnY+CP9+c4nCTDUgg19PQ==
X-Google-Smtp-Source: APXvYqzsp6G7y3NwOVHRY09+SdwkQewuFMAtJSUys7eWw4XEfjH4ln4GMV5tBZs2ifQs0xWG/14owrutG4AoiC3M114=
X-Received: by 2002:a02:a394:: with SMTP id y20mr19482883jak.96.1556524706956; 
	Mon, 29 Apr 2019 00:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190426053324.26443-1-kraxel@redhat.com>
	<CAKMK7uG+vMU0hqqiKAswu=LqpkcXtLPqbYLRWgoAPpsQQV4qzA@mail.gmail.com>
	<20190429075413.smcocftjd2viznhv@sirius.home.kraxel.org>
In-Reply-To: <20190429075413.smcocftjd2viznhv@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 29 Apr 2019 09:58:14 +0200
Message-ID: <CAKMK7uFB8deXDMP9cT634p_dK5LsM37R1v_vGhAEY1ZLZ+WBVA@mail.gmail.com>
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
	David Airlie <airlied@redhat.com>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>
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

On Mon, Apr 29, 2019 at 9:54 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Fri, Apr 26, 2019 at 04:21:37PM +0200, Daniel Vetter wrote:
> > On Fri, Apr 26, 2019 at 7:33 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > This reverts commit f4c34b1e2a37d5676180901fa6ff188bcb6371f8.
> > >
> > > Simliar to commit a0cecc23cfcb Revert "drm/virtio: drop prime
> > > import/export callbacks".  We have to do the same with qxl,
> > > for the same reasons (it breaks DRI3).
> > >
> > > Drop the WARN_ON_ONCE().
> > >
> > > Fixes: f4c34b1e2a37d5676180901fa6ff188bcb6371f8
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> >
> > Maybe we need some helpers for virtual drivers which only allow
> > self-reimport and nothing else at all?
>
> The current gem prime helpers handle this reasonable well,
> I don't see a need for that.
>
> More useful would be some way to signal this self-reimport capability
> to userspace somehow.  See DRM_PRIME_CAP_LOCAL patch.

Userspace is supposed to test whether import/export works for a
specific combo, not blindly assume it does and then keel over. I think
we need to fix that, not add more flags - there's lots of reasons why
a given pair of devices can't share buffers (e.g. all the contiguous
allocations stuff on socs).

> Right now I have the choice to set DRM_PRIME_CAP_{IMPORT,EXPORT}, in
> which case some userspace assumes it can do cross-driver export/import
> and trips over that not working.  Or I do not set
> DRM_PRIME_CAP_{IMPORT,EXPORT}, which breaks DRI3 ...

Yeah that's not an option.
-Daniel

> > I think there's qxl, virgl,
>
> export is implemented for virgl, and import should be possible too.
>
> qxl/bochs is simliar to vmgfx, it could be done but dma-bufs would
> basically be bounce buffers (need copy from/to vram) so probably not
> worth the effort.
>
> cheers,
>   Gerd
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
