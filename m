Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF9D23DACA
	for <lists.virtualization@lfdr.de>; Thu,  6 Aug 2020 15:35:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 613CF87C56;
	Thu,  6 Aug 2020 13:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmiVurRXyU2x; Thu,  6 Aug 2020 13:35:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D222881D7;
	Thu,  6 Aug 2020 13:35:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B0D8C004C;
	Thu,  6 Aug 2020 13:35:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05096C004C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Aug 2020 13:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E6E9C88363
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Aug 2020 13:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LOhdLRg2XnlP
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Aug 2020 13:35:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F088B882B2
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Aug 2020 13:35:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00621ABE4;
 Thu,  6 Aug 2020 13:35:34 +0000 (UTC)
Subject: Re: [PATCH v2 4/6] mm/page_isolation: cleanup
 set_migratetype_isolate()
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20200730093416.36210-1-david@redhat.com>
 <20200730093416.36210-5-david@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <74a25986-87cb-7ab6-e7a9-0c2aefcabe4a@suse.cz>
Date: Thu, 6 Aug 2020 15:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730093416.36210-5-david@redhat.com>
Content-Language: en-US
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Michal Hocko <mhocko@suse.com>,
 Baoquan He <bhe@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
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

On 7/30/20 11:34 AM, David Hildenbrand wrote:
> Let's clean it up a bit, simplifying error handling and getting rid of
> the label.

Nit: the label was already removed by patch 1/6?

> Reviewed-by: Baoquan He <bhe@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/page_isolation.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> index d099aac479601..e65fe5d770849 100644
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -17,12 +17,9 @@
>  
>  static int set_migratetype_isolate(struct page *page, int migratetype, int isol_flags)
>  {
> -	struct page *unmovable = NULL;
> -	struct zone *zone;
> +	struct zone *zone = page_zone(page);
> +	struct page *unmovable;
>  	unsigned long flags;
> -	int ret = -EBUSY;
> -
> -	zone = page_zone(page);
>  
>  	spin_lock_irqsave(&zone->lock, flags);
>  
> @@ -51,13 +48,13 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
>  									NULL);
>  
>  		__mod_zone_freepage_state(zone, -nr_pages, mt);
> -		ret = 0;
> +		spin_unlock_irqrestore(&zone->lock, flags);
> +		drain_all_pages(zone);
> +		return 0;
>  	}
>  
>  	spin_unlock_irqrestore(&zone->lock, flags);
> -	if (!ret) {
> -		drain_all_pages(zone);
> -	} else if ((isol_flags & REPORT_FAILURE) && unmovable) {
> +	if (isol_flags & REPORT_FAILURE) {
>  		/*
>  		 * printk() with zone->lock held will likely trigger a
>  		 * lockdep splat, so defer it here.
> @@ -65,7 +62,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
>  		dump_page(unmovable, "unmovable page");
>  	}
>  
> -	return ret;
> +	return -EBUSY;
>  }
>  
>  static void unset_migratetype_isolate(struct page *page, unsigned migratetype)
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
