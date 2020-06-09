Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 533841F4106
	for <lists.virtualization@lfdr.de>; Tue,  9 Jun 2020 18:36:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0761386AB2;
	Tue,  9 Jun 2020 16:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AQZLbC7dwWQ5; Tue,  9 Jun 2020 16:36:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8DD8086A63;
	Tue,  9 Jun 2020 16:36:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57FD9C016F;
	Tue,  9 Jun 2020 16:36:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D452C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 16:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 08161888EC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 16:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I+O5DZs8eCeo
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 16:36:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BB669888E5
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 16:36:13 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id c12so12875813lfc.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 09 Jun 2020 09:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D4GVUV06S0hWAHhHLNuV2oCZMhRZkgp0I10skQ1Dc94=;
 b=J5CxT4R0bmeW54c/8fhnQipIQ+oqkDgWj19dBafAnZm5CyV8ZtgUQHGp9m5HBB8ecX
 bwWgefQwGv6G7QeomxkuvGsZjovo7EYcL3pq/bdzV9qiG6bM9y5q8VyZhCw1ElUlj7uu
 SKTs6wTfO2CF3k2LtVXnWwFQgJoF96jxJIR0y+865c9LBcKX+zZnnGG+oML7DG0/FHsx
 yT60UooY5vOuAR1ybT0YnkRqKGJJdjqz+kdIaOqcnaBxH4DlhPKnbUmlzMpqDF1P4uHr
 PsiYDATVkNgXOhMcXtBNkOFaejY8IIV/Py/Bo7+7jKcaR4GN4qewodkG+bEIwqaId+a2
 hlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D4GVUV06S0hWAHhHLNuV2oCZMhRZkgp0I10skQ1Dc94=;
 b=peSl6HjHywbXiYKcaPLsep3WZQV8gLixnYpOy9GrDdXBlQC3UsibLP5IOt8E8fwuzT
 MO5k4vwOisFt2t2iGlIGW164U7WcMsMA2t3xio8IXsaHejzmVj9j7yDkJ5F2J6/HNwL8
 2dy1fO59eiB6FJX+rlNK942mdDolnHgOIMT4O7mb8Hk9biAh9/keZKu+zL0E30+ZUwn9
 v0+MadgbRH26GGnbqHeeauzfylXZegOgZ9KoDX3I0G29S4w2eNSoOsSCvEyhNR/OqfzW
 uul4bZ5lzANHqWJlN30flJskaBLsDxA+j6uKNEQINLmG3+0BnaTiLfV+uzzpYqoct9yj
 ybhQ==
X-Gm-Message-State: AOAM53178evhydkF9uL9yr+DVLqq5szU1GcoW8DkbwneHfUV3hMyKE69
 RRPWpKxwIjMAwFf9BwX5lgv1hCdG7R48JkjxUns=
X-Google-Smtp-Source: ABdhPJw5dLwmKcTFf4zTcXWyFF8kwPcnwZadNs4ncOsN+lCnDR8exfUBYvHCqhpcRfc6dPB9i0/leZv/s9ksygoSf1g=
X-Received: by 2002:ac2:489a:: with SMTP id x26mr15977296lfc.111.1591720571515; 
 Tue, 09 Jun 2020 09:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200609124610.3445662-16-kieran.bingham+renesas@ideasonboard.com>
 <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com>
 <CAFqt6zYgS2tgapVQn93jpSnNWZna27wRSd+3ts_HoHm7pRmjZw@mail.gmail.com>
In-Reply-To: <CAFqt6zYgS2tgapVQn93jpSnNWZna27wRSd+3ts_HoHm7pRmjZw@mail.gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 9 Jun 2020 22:05:59 +0530
Message-ID: <CAFqt6zbWstsbwEEyLgafBkAaSM0xvPJhngogh64a5rn6EGJypA@mail.gmail.com>
Subject: Re: [PATCH v2] mm/balloon_compaction: Fix trivial spelling
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Jiri Kosina <trivial@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>, linux-renesas-soc@vger.kernel.org,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>
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

On Tue, Jun 9, 2020 at 10:02 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> On Tue, Jun 9, 2020 at 8:04 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> >
> > The word 'descriptor' is misspelled throughout the tree.
>
> I think, *throughout the tree* is not appropriate* here. This patch
> has fixed it within the file. With that,

Sorry, I read the mail thread in a wrong way. You are right.

>
> Acked-by: Souptick Joarder <jrdr.linux@gmail.com>
>
> >
> > Fix it up accordingly:
> >     decriptors -> descriptors
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Reviewed-by: David Hildenbrand <david@redhat.com>
> > ---
> >  mm/balloon_compaction.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> > index 26de020aae7b..907fefde2572 100644
> > --- a/mm/balloon_compaction.c
> > +++ b/mm/balloon_compaction.c
> > @@ -58,7 +58,7 @@ EXPORT_SYMBOL_GPL(balloon_page_list_enqueue);
> >  /**
> >   * balloon_page_list_dequeue() - removes pages from balloon's page list and
> >   *                              returns a list of the pages.
> > - * @b_dev_info: balloon device decriptor where we will grab a page from.
> > + * @b_dev_info: balloon device descriptor where we will grab a page from.
> >   * @pages: pointer to the list of pages that would be returned to the caller.
> >   * @n_req_pages: number of requested pages.
> >   *
> > @@ -157,7 +157,7 @@ EXPORT_SYMBOL_GPL(balloon_page_enqueue);
> >  /*
> >   * balloon_page_dequeue - removes a page from balloon's page list and returns
> >   *                       its address to allow the driver to release the page.
> > - * @b_dev_info: balloon device decriptor where we will grab a page from.
> > + * @b_dev_info: balloon device descriptor where we will grab a page from.
> >   *
> >   * Driver must call this function to properly dequeue a previously enqueued page
> >   * before definitively releasing it back to the guest system.
> > --
> > 2.25.1
> >
> >
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
