Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 824BA37F9D2
	for <lists.virtualization@lfdr.de>; Thu, 13 May 2021 16:39:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F025608EE;
	Thu, 13 May 2021 14:39:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5aAyMx3FK0RV; Thu, 13 May 2021 14:39:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3DE7608F5;
	Thu, 13 May 2021 14:39:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 713A7C0001;
	Thu, 13 May 2021 14:39:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C58FC0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 14:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A57240281
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 14:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53NTlsP_50L1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 14:39:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53951400C4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620916781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N82rohKdFGCk54k/eUtcJuWMLMB8kINj7ETlJh00UJQ=;
 b=SA8Z53k3/63BzYNTnc9m6WIxbJWLa6fsEcHfbLTYja59q6PcivhXvOKluqy4D6pG3q3En4
 LwsTjLc3fqGzW0t7KgkkstS6g7cnQlByrw9NV6G3EPpO1aUrvqokYa+4FaW8HZqUf5Jgu+
 NR1OdVOZ/qrS5fyQhVtG/1QlONClL+8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-1hoq-GZgPRiiB7U6KwalpA-1; Thu, 13 May 2021 10:39:39 -0400
X-MC-Unique: 1hoq-GZgPRiiB7U6KwalpA-1
Received: by mail-ed1-f70.google.com with SMTP id
 g17-20020aa7dd910000b029038843570b67so14761122edv.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 07:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N82rohKdFGCk54k/eUtcJuWMLMB8kINj7ETlJh00UJQ=;
 b=qYIJwjivRfdTDXQDHkD8+lkPkXxZ+sTe4gQAzuQ4fn2AU7ZFKOlb0g5/v87LJ8vpIv
 UOLdnKYPtvttolF64bst3hlCoTSb43a2R3wAKtYVbriRZa5iG5mbgWcd3BlEu0EpLQrF
 5VkdAQ8uQ0aYqxTEdvkuGwNYJ/iYT7kwh1VfRdn9DUZn3zDm1/Ctz/LJPazxBTjiRx1+
 dfTRSRpZuKHvg6pztM83jpfTbSXpXWzvZcjzLn5XdZC5Kvysjxm8tElLHXj7P+CGxnVp
 vwRv3UeSc0UFUtqppj77O1Z5tGdVJUaNnhXzpVkVuryqJiVrzNSXdoP6WN106NKtKU1Y
 j3VA==
X-Gm-Message-State: AOAM531tHcB5TR+IcnZw8vInm5uo2Eqdq13QaRXCIp57z9I7MRLWA0Dq
 ffodithO6mjNJxyaNUgyrzXjtpJhzqMUq7TMUT+Nu2KEqS5gH2gEbS5emGJVFmiDbc8VbjjASgz
 jLNqaWS8J2FifDymDwIEpJ+Jfp6cbCyxpOOKiTYiR3A==
X-Received: by 2002:a17:907:961e:: with SMTP id
 gb30mr10339757ejc.58.1620916778019; 
 Thu, 13 May 2021 07:39:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6bjGbGDFHaUHXa1mTNhvmWCWVj4h9WkeUZyes40YkuxE3JFn0GzZuWQ5ezvv5REXRd3xrtQ==
X-Received: by 2002:a17:907:961e:: with SMTP id
 gb30mr10339740ejc.58.1620916777865; 
 Thu, 13 May 2021 07:39:37 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id b5sm2360100edz.88.2021.05.13.07.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 07:39:37 -0700 (PDT)
Date: Thu, 13 May 2021 16:39:35 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] vdpa_sim_blk: Fix duplicate included linux/blkdev.h
Message-ID: <20210513143935.7zlpo35d5uvr3ok6@steredhat>
References: <1620903900-69738-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1620903900-69738-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org, wanjiabing@vivo.com,
 linux-kernel@vger.kernel.org, mst@redhat.com
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

On Thu, May 13, 2021 at 07:05:00PM +0800, Jiapeng Chong wrote:
>Clean up the following includecheck warning:
>
>./drivers/vdpa/vdpa_sim/vdpa_sim_blk.c: linux/blkdev.h is included more
>than once.
>
>No functional change.
>
>Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>---
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c | 1 -
> 1 file changed, 1 deletion(-)

Wan sent a similar patch a couple of days ago:
https://lore.kernel.org/patchwork/patch/1422992/

Thanks,
Stefano

>
>diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
>index 5bfe1c2..a790903 100644
>--- a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
>+++ b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
>@@ -15,7 +15,6 @@
> #include <linux/blkdev.h>
> #include <linux/vringh.h>
> #include <linux/vdpa.h>
>-#include <linux/blkdev.h>
> #include <uapi/linux/virtio_blk.h>
>
> #include "vdpa_sim.h"
>-- 
>1.8.3.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
