Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0F61F410C
	for <lists.virtualization@lfdr.de>; Tue,  9 Jun 2020 18:37:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EF2E887E75;
	Tue,  9 Jun 2020 16:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1gAfY3XZmpmW; Tue,  9 Jun 2020 16:37:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7A4B187DA1;
	Tue,  9 Jun 2020 16:37:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65CB3C016F;
	Tue,  9 Jun 2020 16:37:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D445FC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 16:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C219687E75
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 16:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xjQTHU2YzXid
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 16:37:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E754187DA1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 16:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591720635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+II8osbiFfoX/L1u4six/WCUHiqDeOz+O5rD4LfoR2M=;
 b=ORZWZVe7hBiu+tugbKws7HGbJRSMub7vUucuM6XiAQrSxnMmPTrVSQli+SNCkhvle+iRas
 TlCX3T4rZa4XaSXHEEe09AqY8o8qCQpASeNltTjPB49wnWQYjeV95rHcIFixb13hspWOdo
 1hABq2MZNc6JFHquby+hq2fIQkK929k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-TqvLN6e3MDqbvV-qjCousA-1; Tue, 09 Jun 2020 12:37:13 -0400
X-MC-Unique: TqvLN6e3MDqbvV-qjCousA-1
Received: by mail-wr1-f69.google.com with SMTP id r5so8839352wrt.9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 09 Jun 2020 09:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+II8osbiFfoX/L1u4six/WCUHiqDeOz+O5rD4LfoR2M=;
 b=RdgubtDm+gFdeVoOoQJ2vN6V0RpE2jacdeu2ImslqaPzLa/04TpiGAr7xYRsV5c6+D
 VhANc4yTdf+pT80MSCJUeVPcoRD4nqlpB3qeaMXxu5M8vD7TNwq7croFPkHllo1nZOuq
 4J4ch2qJsPPvSeGMKsEoY1oFmB3XZy99dXmDbhhVwA1z/HG+VNgTKq1hKaHbsKVPVYV3
 ThmGYaylK7JvYZmN6sATfW0Hre8/FnArzag6nhzbp4O/prLQizXqataV7691r3vzER+x
 3ir5K0Z0suPiG+MlZDYRB0/LmKWKjuZmy64bWVhW6NI8LPjF8TniM1cPRt1g9/Bk/DpU
 LUJA==
X-Gm-Message-State: AOAM53333HElVyW9h06sreMLJ5PNU+LSW4NDiUFeN+86H47LBUYkyTYw
 l2qi+dwQ5MgtLrXQjKTMVdUWEnnEz8KoowasH7SaUbU4VYOJiSkp8AlSMOxs/OTtfDSyqh2G6FO
 2JfLKXA4Ea52S8Fq95+OJdodNyrQcN/Ooyt7wZvDjYQ==
X-Received: by 2002:a1c:dd44:: with SMTP id u65mr5269008wmg.180.1591720629584; 
 Tue, 09 Jun 2020 09:37:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz93L1cNiCH3xWCKNeXmWCa9GZNaquxVlfU7TmLWNCwG1IA511CFoLPu9aXLiiVBHF4IpYnIg==
X-Received: by 2002:a1c:dd44:: with SMTP id u65mr5268995wmg.180.1591720629341; 
 Tue, 09 Jun 2020 09:37:09 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id a1sm3383430wmj.29.2020.06.09.09.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 09:37:08 -0700 (PDT)
Date: Tue, 9 Jun 2020 12:37:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2] mm/balloon_compaction: Fix trivial spelling
Message-ID: <20200609123652-mutt-send-email-mst@kernel.org>
References: <20200609124610.3445662-16-kieran.bingham+renesas@ideasonboard.com>
 <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jiri Kosina <trivial@kernel.org>, open list <linux-kernel@vger.kernel.org>,
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

On Tue, Jun 09, 2020 at 03:34:12PM +0100, Kieran Bingham wrote:
> The word 'descriptor' is misspelled throughout the tree.
> 
> Fix it up accordingly:
>     decriptors -> descriptors
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Trivial tree pls.

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
>   *				 returns a list of the pages.
> - * @b_dev_info: balloon device decriptor where we will grab a page from.
> + * @b_dev_info: balloon device descriptor where we will grab a page from.
>   * @pages: pointer to the list of pages that would be returned to the caller.
>   * @n_req_pages: number of requested pages.
>   *
> @@ -157,7 +157,7 @@ EXPORT_SYMBOL_GPL(balloon_page_enqueue);
>  /*
>   * balloon_page_dequeue - removes a page from balloon's page list and returns
>   *			  its address to allow the driver to release the page.
> - * @b_dev_info: balloon device decriptor where we will grab a page from.
> + * @b_dev_info: balloon device descriptor where we will grab a page from.
>   *
>   * Driver must call this function to properly dequeue a previously enqueued page
>   * before definitively releasing it back to the guest system.
> -- 
> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
