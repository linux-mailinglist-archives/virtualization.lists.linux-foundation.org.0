Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF7D1F40F8
	for <lists.virtualization@lfdr.de>; Tue,  9 Jun 2020 18:32:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 324F6878E1;
	Tue,  9 Jun 2020 16:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUfJhVXrCQ82; Tue,  9 Jun 2020 16:32:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BDA9D87E61;
	Tue,  9 Jun 2020 16:32:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A70B1C016F;
	Tue,  9 Jun 2020 16:32:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CA79C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 16:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6AF3987E4D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 16:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2NNy6RcvOXOs
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 16:32:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5A977878E1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 16:32:45 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id e125so12885726lfd.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 09 Jun 2020 09:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6go56Xq/RaTcO68WpES6+R++GmUHJ81WAyZebs67Wk0=;
 b=qLhEyBBAgr9n7RhT9t8a+uMdszZsW8+Dg02MTl7mAYbm/cmLLAt7T8IEoHH2I8M2JY
 uCvwR4QmEx8zf4yVpzaIpeo4E9XsEG7YNac9sO2H/JxclOWrUsrdF6W7ucUvApbFXlpZ
 9t29u3VwR/1AUZIFsRwJ3WU65f8pUbPbMGCjWMnRYIpeCGaT1pgxuAwZCgZuSVSMKY8h
 yvNe9miWfYGPistvQuUwQ7tTYflvOKeCGG3SqWu/HKHTxFdPBMggetEuKgjftFv35Yag
 KDVZyvPezB/CZ3RjR4dze3XOKAfoHYmqOtHVkyWGIAkayPybhpOLKfe8EmO7YHd5MoyM
 lvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6go56Xq/RaTcO68WpES6+R++GmUHJ81WAyZebs67Wk0=;
 b=hd8kI8BD/QXo/cWpiiod85TCLB7ogLQx4nHMONnxFnLXCuXjdtXje6jKuJd4jxr96U
 rye55Bs2zdgSNTZ1ea9XgE23SyQsKmTcfsLQXSS+qfTR5gA94yPnUmtL7n8ayKurnLua
 +JSrn0rhomQBxsRcwgLlrSBRIUJQhU5Q88C0ECVwPykeT6icjbEIcMYaS94IXLbtjiij
 6U6KAax7k4mlSgyWCTzvK4jwb+Quknspke36ju1UxzjWmZqvYuj97LCwfDDBvK90qNFA
 WG6DqBcfIri21ZWYg/rOcj++drVN3qN0BuuQjG2Pe50V3E70zvGApLdQ+GayxF5b28ay
 h0aw==
X-Gm-Message-State: AOAM530/EUxYR8QBois1SFUQbosXQ1J0RSrBAg6PoVZ/aftCt53C/TTf
 QL8XiHv97JyDgiMUShu56cxjT/7nFmQFrtVsNaI=
X-Google-Smtp-Source: ABdhPJwetwbDhwOaowJM1IHjUeIE7J7rEQPR8y86E24tiPXpi8eNRnGgcRhUUqDsZIa/Gm7jnTwnZMCNoiw+R15qhq8=
X-Received: by 2002:a19:2250:: with SMTP id i77mr16078586lfi.133.1591720363254; 
 Tue, 09 Jun 2020 09:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200609124610.3445662-16-kieran.bingham+renesas@ideasonboard.com>
 <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 9 Jun 2020 22:02:31 +0530
Message-ID: <CAFqt6zYgS2tgapVQn93jpSnNWZna27wRSd+3ts_HoHm7pRmjZw@mail.gmail.com>
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

On Tue, Jun 9, 2020 at 8:04 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> The word 'descriptor' is misspelled throughout the tree.

I think, *throughout the tree* is not appropriate* here. This patch
has fixed it within the file. With that,

Acked-by: Souptick Joarder <jrdr.linux@gmail.com>

>
> Fix it up accordingly:
>     decriptors -> descriptors
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/balloon_compaction.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> index 26de020aae7b..907fefde2572 100644
> --- a/mm/balloon_compaction.c
> +++ b/mm/balloon_compaction.c
> @@ -58,7 +58,7 @@ EXPORT_SYMBOL_GPL(balloon_page_list_enqueue);
>  /**
>   * balloon_page_list_dequeue() - removes pages from balloon's page list and
>   *                              returns a list of the pages.
> - * @b_dev_info: balloon device decriptor where we will grab a page from.
> + * @b_dev_info: balloon device descriptor where we will grab a page from.
>   * @pages: pointer to the list of pages that would be returned to the caller.
>   * @n_req_pages: number of requested pages.
>   *
> @@ -157,7 +157,7 @@ EXPORT_SYMBOL_GPL(balloon_page_enqueue);
>  /*
>   * balloon_page_dequeue - removes a page from balloon's page list and returns
>   *                       its address to allow the driver to release the page.
> - * @b_dev_info: balloon device decriptor where we will grab a page from.
> + * @b_dev_info: balloon device descriptor where we will grab a page from.
>   *
>   * Driver must call this function to properly dequeue a previously enqueued page
>   * before definitively releasing it back to the guest system.
> --
> 2.25.1
>
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
