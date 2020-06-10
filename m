Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD841F50B5
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 11:00:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3505125BDA;
	Wed, 10 Jun 2020 09:00:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lVakQxa0tmRr; Wed, 10 Jun 2020 09:00:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A432B25AD8;
	Wed, 10 Jun 2020 09:00:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F0B6C016F;
	Wed, 10 Jun 2020 09:00:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 554F9C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 51A9687F83
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3feXUqhdh1Xm
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:00:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5307B87E8C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:00:35 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id z9so1459561ljh.13
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 02:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3Xy5FYp2soFgJF6nnVbxCLrmBCUlrALdR15rY+pn3PI=;
 b=SMyYraGTdLcKtomGzhcja//vZGyqisk3nY+VV/zD14VFCWQtumfekcnhuBq+Rv2DDt
 nFICH03bVssMzSGyGbf05DOm//tpS8Hurs0XAF2lMvyYu5WPKaa7WUTqrilGqi+pAQdU
 VFW/Chfsh0+typdG8SUEUu7gI9n+TX7IHDJY5FstpvVyLIuD89NAJnjWTtOWFBY5dtAh
 MMN7ayo5RHYBrPjght1o1WBlylykrjlQLxoNrWOGfqaBrdrDxpoueaO377sDDKhh8uyv
 LSj0YV6xbJJ0cto3U8F6QHdyH9+8g7+MaQKd4WKbADnPeWT3afL1ExkGSKfYL9H6HfK2
 6NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Xy5FYp2soFgJF6nnVbxCLrmBCUlrALdR15rY+pn3PI=;
 b=bEu9TcXfiIYzdY1AseVFL+cMk0X9wIjv6Qn6JVkgfhSNsacKtetVnxfX8rXT5tGuKU
 bRE4tnmIewOHmG5TYnkZkZOaI88CKyl+bUsG00rMzCeFfYrDLV0lY7U1S1onAXlg5AWA
 R2qiDM6zIPJQ9mZ/kNKF55Iof/zk3JbeVNykfbfMwXaZqxANCpxv3xF6vJ4cQrJQgSug
 zQVRTu7u5nfPGg7afEiTW8GdNNQIcm44B25Lr0tjXhMFXDnYbcrOOAE1xr6a4hkL8RfU
 UtNhfpdcLSB8YMqajBmuEqd9jA+mpdHkk58L/hu7dUbMggR+oGKp0d63YQ54wD5Ohrws
 8hjQ==
X-Gm-Message-State: AOAM5329AiYel8NaOeHJ6scrJCE2r7ROudFWrZKygfGI3lwh6CoPIQOR
 MNWUxc+jTtSFxU/pNegPT+3mZQ==
X-Google-Smtp-Source: ABdhPJz5MjnnfWmDVh/izTf6DzFOxa3aA+p/p4WuULzzaQDFaso47AUKpZw51XA/g+2bfjZ7YAvxtw==
X-Received: by 2002:a05:651c:508:: with SMTP id
 o8mr1177157ljp.112.1591779633288; 
 Wed, 10 Jun 2020 02:00:33 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8b6:350a:b96f:7066:1c4d:ff8d?
 ([2a00:1fa0:8b6:350a:b96f:7066:1c4d:ff8d])
 by smtp.gmail.com with ESMTPSA id o4sm5666802lff.78.2020.06.10.02.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 02:00:32 -0700 (PDT)
Subject: Re: [PATCH v2] mm/balloon_compaction: Fix trivial spelling
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 David Hildenbrand <david@redhat.com>
References: <20200609124610.3445662-16-kieran.bingham+renesas@ideasonboard.com>
 <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6b13243c-db22-ef33-8aed-9b385cc10b58@cogentembedded.com>
Date: Wed, 10 Jun 2020 12:00:23 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com>
Content-Language: en-US
Cc: Jiri Kosina <trivial@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hello!

On 09.06.2020 17:34, Kieran Bingham wrote:

> The word 'descriptor' is misspelled throughout the tree.
> 
> Fix it up accordingly:
>      decriptors -> descriptors

       decriptor -> descriptor really. ;-)

> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/balloon_compaction.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> index 26de020aae7b..907fefde2572 100644
> --- a/mm/balloon_compaction.c
> +++ b/mm/balloon_compaction.c
> @@ -58,7 +58,7 @@ EXPORT_SYMBOL_GPL(balloon_page_list_enqueue);
>   /**
>    * balloon_page_list_dequeue() - removes pages from balloon's page list and
>    *				 returns a list of the pages.
> - * @b_dev_info: balloon device decriptor where we will grab a page from.
> + * @b_dev_info: balloon device descriptor where we will grab a page from.
>    * @pages: pointer to the list of pages that would be returned to the caller.
>    * @n_req_pages: number of requested pages.
>    *
> @@ -157,7 +157,7 @@ EXPORT_SYMBOL_GPL(balloon_page_enqueue);
>   /*
>    * balloon_page_dequeue - removes a page from balloon's page list and returns
>    *			  its address to allow the driver to release the page.
> - * @b_dev_info: balloon device decriptor where we will grab a page from.
> + * @b_dev_info: balloon device descriptor where we will grab a page from.
>    *
>    * Driver must call this function to properly dequeue a previously enqueued page
>    * before definitively releasing it back to the guest system.

MBR, Sergei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
