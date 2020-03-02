Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F05175C82
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 15:03:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 67BCA8506C;
	Mon,  2 Mar 2020 14:03:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmmDLpGHYy3Z; Mon,  2 Mar 2020 14:03:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E46B68503D;
	Mon,  2 Mar 2020 14:03:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B970DC1D8F;
	Mon,  2 Mar 2020 14:03:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56792C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 14:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 41CF48503D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 14:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DT4TegEOIiL5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 14:03:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4A08983241
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 14:03:14 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e10so11290419wrr.10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 06:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z+UglYKv1Dwx2e9r/aDCnJWSItXjpOM15W1jiZYfefY=;
 b=bqhABdB2viW0IbatyR843D7L54ZkWTyflOUEMtPNFsyqIDurSgIUvMrbZBO/RobeIk
 GBQna2qbSCoF76lPLGflgDLb1NW9uVwH0Eu4nvfIxeU6ZThB96Sx1ka0droVO/6lf2pN
 j8f+OB1Dh4LBQpcMqgDyWueXUJ34opLGsBf5MuVsKecwYe/aCQ582KZZ+SpipM0zfv5C
 v1tiJKCztq5J8Zvl2KW4YKt+AfR+tDk0JACThYeuHdw5nZZhOpOUoLZpgMn+cl73RUBB
 BtgtKQPc+C7ITqH4FC2d1otGyDXe7FH3W0j4xChvIZ6VCLPNevl/w+9t7gymTnxbF9yn
 kyiQ==
X-Gm-Message-State: APjAAAX9qhH17rSgOqj28PynmZyvnCqcOpydFYVeihbudM96BRRSRIUE
 Jo8/pqqGCTxnFeW+fnwsCWk=
X-Google-Smtp-Source: APXvYqzNlCJ57BpY/mMPxIq3KUzXka2/8lIi9TR4CaC2Gp0sGaxqiJbgkHNQYdBVahmYIfvhPV/tig==
X-Received: by 2002:adf:fe0a:: with SMTP id n10mr23857788wrr.229.1583157792337; 
 Mon, 02 Mar 2020 06:03:12 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id j4sm17021673wrr.0.2020.03.02.06.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 06:03:11 -0800 (PST)
Date: Mon, 2 Mar 2020 15:03:09 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 01/11] ACPI: NUMA: export pxm_to_node
Message-ID: <20200302140309.GM4380@dhcp22.suse.cz>
References: <20200302134941.315212-1-david@redhat.com>
 <20200302134941.315212-2-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302134941.315212-2-david@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, linux-acpi@vger.kernel.org,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Len Brown <lenb@kernel.org>
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

On Mon 02-03-20 14:49:31, David Hildenbrand wrote:
> Will be needed by virtio-mem to identify the node from a pxm.

No objection to export the symbol. But it is almost always better to add
the export in the patch that actually uses it. The intention is much
more clear that way.

> Acked-by: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: linux-acpi@vger.kernel.org
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michal Hocko <mhocko@suse.com> # for the export

> ---
>  drivers/acpi/numa/srat.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
> index 47b4969d9b93..5be5a977da1b 100644
> --- a/drivers/acpi/numa/srat.c
> +++ b/drivers/acpi/numa/srat.c
> @@ -35,6 +35,7 @@ int pxm_to_node(int pxm)
>  		return NUMA_NO_NODE;
>  	return pxm_to_node_map[pxm];
>  }
> +EXPORT_SYMBOL(pxm_to_node);
>  
>  int node_to_pxm(int node)
>  {
> -- 
> 2.24.1
> 

-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
