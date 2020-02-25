Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8C016C393
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 15:13:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 47574203A4;
	Tue, 25 Feb 2020 14:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lWRfuRU12sBm; Tue, 25 Feb 2020 14:13:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 96D1D203A0;
	Tue, 25 Feb 2020 14:13:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D159C0177;
	Tue, 25 Feb 2020 14:13:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B01AC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 14:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 33BDA2037E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 14:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vEdDIvrOr4Qs
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 14:13:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 163652035E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 14:13:42 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j7so2384683wrp.13
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 06:13:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jxubRze50o1F8gM76cssrAcVTC+kj7bPygK0ClbrEFQ=;
 b=JrtfSjQpyMDMDMSUqsNFUHfcvMCSVPYyDl3PEonALuxWCunx1O0DlUFJREZX460/Z6
 QOEoNjPxqRKfjnxbX+JH+kklZrt1fc7dGJlkE8m8y42ujJQVlgd5Z4F9A2NUny/Xua7M
 f1U8j9upxnkep6Dh5ieQCft/kUs1JbB+uAqsCAgBloan+TLLZLYEokTun0/4flk/MXeJ
 pziUImSMyflzO6y/8U0DPVm6RB//ShY9MrkljpnF7q/25YGIYtQTUJQ+p1qQlXkjxWj1
 edbvHuA/vrdFdB22EpjVzfWpYckAbWErn4JSaHNA4Lgu2nTS0m+UOpbeLYtFHEv4xyNp
 Ue4w==
X-Gm-Message-State: APjAAAU0fFoDvEIeWqM1cTXLjWd9Ou6bweDCY2m39q556VM8/CPlxWCh
 sSRO9kwVuilrWom7URu3CG0=
X-Google-Smtp-Source: APXvYqzZDJ3iAatx+c1W9QUy0WfZcIu4vrV7Thvn1lJDb6r3o5K5088UhtDeqAbWOuXq8UUYWOou1g==
X-Received: by 2002:a5d:55c1:: with SMTP id i1mr79044434wrw.347.1582640020664; 
 Tue, 25 Feb 2020 06:13:40 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id b10sm4161691wmj.48.2020.02.25.06.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 06:13:40 -0800 (PST)
Date: Tue, 25 Feb 2020 15:13:39 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v4 11/13] mm/vmscan: Move count_vm_event(DROP_SLAB)
 into drop_slab()
Message-ID: <20200225141339.GV22443@dhcp22.suse.cz>
References: <20191212171137.13872-1-david@redhat.com>
 <20191212171137.13872-12-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212171137.13872-12-david@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
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

On Thu 12-12-19 18:11:35, David Hildenbrand wrote:
> Let's count within the function itself, so every invocation (of future
> users) will be counted.
> 
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-fsdevel@vger.kernel.org
> Signed-off-by: David Hildenbrand <david@redhat.com>

Slight inconsistency with the page cache droppint but nothing earth
shattering.

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  fs/drop_caches.c | 4 +---
>  mm/vmscan.c      | 1 +
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/drop_caches.c b/fs/drop_caches.c
> index d31b6c72b476..a042da782fcd 100644
> --- a/fs/drop_caches.c
> +++ b/fs/drop_caches.c
> @@ -61,10 +61,8 @@ int drop_caches_sysctl_handler(struct ctl_table *table, int write,
>  			iterate_supers(drop_pagecache_sb, NULL);
>  			count_vm_event(DROP_PAGECACHE);
>  		}
> -		if (sysctl_drop_caches & 2) {
> +		if (sysctl_drop_caches & 2)
>  			drop_slab();
> -			count_vm_event(DROP_SLAB);
> -		}
>  		if (!stfu) {
>  			pr_info("%s (%d): drop_caches: %d\n",
>  				current->comm, task_pid_nr(current),
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 5a6445e86328..c3e53502a84a 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -726,6 +726,7 @@ void drop_slab(void)
>  
>  	for_each_online_node(nid)
>  		drop_slab_node(nid);
> +	count_vm_event(DROP_SLAB);
>  }
>  
>  static inline int is_page_cache_freeable(struct page *page)
> -- 
> 2.23.0

-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
