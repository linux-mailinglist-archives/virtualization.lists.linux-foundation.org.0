Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A06392F6C
	for <lists.virtualization@lfdr.de>; Thu, 27 May 2021 15:23:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B30ED60B17;
	Thu, 27 May 2021 13:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gRABbbJ82q99; Thu, 27 May 2021 13:23:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8826160AC7;
	Thu, 27 May 2021 13:23:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35351C0001;
	Thu, 27 May 2021 13:23:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D09FC0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 May 2021 13:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B92D608FC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 May 2021 13:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DUbSOFqP2VAL
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 May 2021 13:23:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD29D608B6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 May 2021 13:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622121810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NHsIQJhjaJ9zmhpKCmH9eFnUstaH3DkdMMtmjVXKIOU=;
 b=b1QK0pPQZCzjRtSxiJcCjqoJOA15TnG/DYw2q9xp/UyTPf2GnFXzh3fLSSiLMvU6MV0Wrg
 gNGfZBhnwABQgHXuBLoaIAq27oBklRHodquTi+gzi/P575xf4zfZW5krH+qsstFsGWQZKO
 XIgDNiY2MepuSWqbNoQkyLUaZGsxaXo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-VHImA6rrMf6ZcJWSFkSIyg-1; Thu, 27 May 2021 09:23:27 -0400
X-MC-Unique: VHImA6rrMf6ZcJWSFkSIyg-1
Received: by mail-ej1-f71.google.com with SMTP id
 x20-20020a1709061354b02903cff4894505so1664370ejb.14
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 May 2021 06:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NHsIQJhjaJ9zmhpKCmH9eFnUstaH3DkdMMtmjVXKIOU=;
 b=kDRsDv5t75yxP1Cj94yyLy5RFaZ6/TSV2lT+y2O3s/3sNJERXJw79j82XOOGc5GTuu
 ySJ0pbzhePNuqe9dvWldXthLiH+hIsXbgU93miI3VQE0Eca7HoDtw7IkOyHmr6prZecD
 6XA6R39t8u5CmMot5ykgbTgZGsluR2e19fBncdZHBZCzeFbKnGkfKTlJu2f3ELejrIFH
 m2PI5DGAcBfkz/hU1nsB3mQQrAAHKIBmWXX/WTXXr1ADUHzFndjqOe9MJBbLC+IPXyPd
 wn/tt/r9PaBn4BFAq2sYwCr9rvl6pcz8GkdGHoWFsIF1cXoVe9aaAmUFfoyPcGI1CH5h
 ETeA==
X-Gm-Message-State: AOAM530M51fKIJnmow/UZD2OrPMrqn5rZGNHWIhtUhIKErLmU18hrn1G
 OxcV6VSrGkkyIYxe0W2GqmpnizpFfgPMXMRbgHmKQ0mpP3t5VlWxEcvDZWvYN+YNN8jbJHoFw4N
 LJxNJfcRLKQeCytxsX4LsSo+nkPKCydYuCYSP0GhV0A==
X-Received: by 2002:a05:6402:3587:: with SMTP id
 y7mr4017006edc.360.1622121805907; 
 Thu, 27 May 2021 06:23:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8BH+Z7WjU6R8Sc+c920kMoMoVBQUuMl3i00V6kvPgTbHrdJ2zmcxtpY0Zrl6LJD3FdcBcdg==
X-Received: by 2002:a05:6402:3587:: with SMTP id
 y7mr4016987edc.360.1622121805757; 
 Thu, 27 May 2021 06:23:25 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id p15sm1118635edr.50.2021.05.27.06.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 06:23:25 -0700 (PDT)
Date: Thu, 27 May 2021 15:23:23 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 5/5] vhost: fix up vhost_work coding style
Message-ID: <20210527132323.n3efsd6kfgohnaty@steredhat>
References: <20210525174733.6212-1-michael.christie@oracle.com>
 <20210525174733.6212-6-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20210525174733.6212-6-michael.christie@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-scsi@vger.kernel.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 stefanha@redhat.com, pbonzini@redhat.com
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

On Tue, May 25, 2021 at 12:47:33PM -0500, Mike Christie wrote:
>Switch from a mix of tabs and spaces to just tabs.
>
>Signed-off-by: Mike Christie <michael.christie@oracle.com>
>---
> drivers/vhost/vhost.h | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
>index 575c8180caad..7d5306d1229d 100644
>--- a/drivers/vhost/vhost.h
>+++ b/drivers/vhost/vhost.h
>@@ -20,9 +20,9 @@ typedef void (*vhost_work_fn_t)(struct vhost_work *work);
>
> #define VHOST_WORK_QUEUED 1
> struct vhost_work {
>-	struct llist_node	  node;
>-	vhost_work_fn_t		  fn;
>-	unsigned long		  flags;
>+	struct llist_node	node;
>+	vhost_work_fn_t		fn;
>+	unsigned long		flags;
> };
>
> /* Poll a file (eventfd or socket) */
>-- 
>2.25.1
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
