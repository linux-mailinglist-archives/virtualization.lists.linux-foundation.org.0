Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2601DA3BF0
	for <lists.virtualization@lfdr.de>; Fri, 30 Aug 2019 18:26:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7CBFC62A8;
	Fri, 30 Aug 2019 16:26:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ED76F617E
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 16:24:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8FC5CEC
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 16:24:49 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z3so15279517iog.0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 09:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RHySHF2uwEhmKQaEHe0OPL8GmZZ5+dREwVbeFYlqd3c=;
	b=dwn0RWHZ+Um+l/0l8KxAVtK9/XCUY5drIfMskunEhTk7upC2I0w2tmibG77Ds/21/4
	JJoGM8HWSM3DCAtH8AYBZ/LmZvoJJq0x1jKREkrFnk7jfkKC2BJRP3GFMnR6ic9Jffd0
	sVC0h7v9o6ui5kdqEwP0wwyIEkuJIVTh0SNgDPCZEdEajFrRJZ4SXg8ivCSGaTHeVhYn
	wm3/6YbtHhrI9Gq5JRL9k0wJZSUi7JTiSLGn5xb+NLTOkKT9BS73IUko0kK/Fd71nOj1
	joRjzfXCPtV8W9B/esh4Ea2p3xu9AEEt2gvLMkGyYH6BCRhnEKilZRSt3SHab1J21YR3
	8ihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RHySHF2uwEhmKQaEHe0OPL8GmZZ5+dREwVbeFYlqd3c=;
	b=AD5Wg1S3fkvDC74/Hh6wvXt6c10n3NEGNhh/P5UUmyUBJnIeZjxSKH0yAajvlVVT0m
	fssO8XvGKnH1iBaXRrHXXWmu0f8PpsJ+EWzQv6KSjxfssC+hnyg52QZ8Rkdo0Q8S6d5D
	ayDQuSZ7wOwa3NVRqG7Xw+xpj0ldEFtNgdsVbNPTglEvDeJu6wu0fz0ftMb6hugtztk9
	FNUcgICV6Z5JM5ueEUZLZoZWQY6woLSWFIh1qFWKVujLpE2A+jscBOIbOx09iskv2/4q
	uDYRiW0pGS6U2EEQCTF816bGEk3Migl2ooltZstgp9W40ST9du6jkGXuHeFFkylpg2pB
	IloQ==
X-Gm-Message-State: APjAAAVHDpqhqLLoTlbZ0BSAT/5wnZaQF75WbjIxo0hAvjczPwBpJnD/
	NmwMnAriuj8ASbC3wjHZDnK7F5m9A/cWshRQb9o=
X-Google-Smtp-Source: APXvYqwdBntb7kZCrsB+QQ9/2O7jjxtojMf474NZbsTPQdQ/YH+u5yW+U8plZem5ml3b+bETz1LpbVWveMMm96zRFJg=
X-Received: by 2002:a5d:96cb:: with SMTP id r11mr19355270iol.200.1567182288772;
	Fri, 30 Aug 2019 09:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190829212417.257397-1-davidriley@chromium.org>
	<20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
	<CAASgrz2v0DYb_5A3MnaWFM4Csx1DKkZe546v7DG7R+UyLOA8og@mail.gmail.com>
	<20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
In-Reply-To: <20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 30 Aug 2019 09:24:37 -0700
Message-ID: <CAPaKu7QeYDqek7pBSHmg1E5A9h9E=njrvLxBMnkCtqeb3s77Cg@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	=?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
	"open list:VIRTIO CORE,
	NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>
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

On Fri, Aug 30, 2019 at 4:16 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > > -     kfree(vbuf->data_buf);
> > > > +     kvfree(vbuf->data_buf);
> > >
> > > if (is_vmalloc_addr(vbuf->data_buf)) ...
> > >
> > > needed here I gues?
> > >
> >
> > kvfree() handles vmalloc/kmalloc/kvmalloc internally by doing that check.
>
> Ok.
>
> > - videobuf_vmalloc_to_sg in drivers/media/v4l2-core/videobuf-dma-sg.c,
> > assumes contiguous array of scatterlist and that the buffer being converted
> > is page aligned
>
> Well, vmalloc memory _is_ page aligned.
>
> sg_alloc_table_from_pages() does alot of what you need, you just need a
> small loop around vmalloc_to_page() create a struct page array
> beforehand.
>
> Completely different approach: use get_user_pages() and don't copy the
> execbuffer at all.
It would be really nice if execbuffer does not copy.

The user space owns the buffer and may overwrite the contents
immediately after the ioctl.  We also need a flag to indicate that the
ownership of the buffer is transferred to the kernel.




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
