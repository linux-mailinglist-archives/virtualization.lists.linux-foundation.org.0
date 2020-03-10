Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A19AA17F68D
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 12:43:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 466B2882FB;
	Tue, 10 Mar 2020 11:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74TuppLuLe29; Tue, 10 Mar 2020 11:43:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E52CE88309;
	Tue, 10 Mar 2020 11:43:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC141C0177;
	Tue, 10 Mar 2020 11:43:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1840DC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0D048882FB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BGOzV9HGiDwu
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:43:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D81A6882F8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:43:15 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 6so1011944wmi.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 04:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hMBSAZ2w6rHBlgdOMKsoKxalij10II+RdrF1ljWYIAk=;
 b=OSpROw9kg4630VgL+QAQM1i43suPJ4tqG51rCLfMNrmJNpx6aaNevBUPaHozwgbpyt
 Qv4fRjL6Y7Q4AZk1G21DZE/B1xnH8Dr/WN+nNLb9DYKIV6yXbvApnE+YApvWn4+WBavT
 mHq+E4f+sV8UjGfRlBQUKf59zEMvF4RHT5qzlWUZSGAjlk9wvkwJ68kM7q8z9nlsjlWd
 dyXg5OcfoaljFvRA7N9I7D/1JuVsBDpg0O8IKvkQxtm31lKPoz9ZvJek/GWpFqMyEujm
 dqYg2flmCt09Kk4+X8HswulMLQQZ7pyh3UnyguUpqZNy0XAynBuZ4JKsrNkkLDrVOoQn
 ICZw==
X-Gm-Message-State: ANhLgQ1VXTe0h8mfs8z4kp1U6zB3pF73FWvwUbHXdFIKYTNOLDi7c24/
 dKFJBlJvKPbZkhSJsmYf5QA=
X-Google-Smtp-Source: ADFU+vuKZ/41TrYfhsXloC/F2fawinzqxCwHUoA7MsTg/Xb+5sVoVBhrkM90t/0amNfG09qJHc1Ixg==
X-Received: by 2002:a05:600c:d8:: with SMTP id
 u24mr1820247wmm.165.1583840594393; 
 Tue, 10 Mar 2020 04:43:14 -0700 (PDT)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id e20sm4703596wrc.97.2020.03.10.04.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 04:43:13 -0700 (PDT)
Date: Tue, 10 Mar 2020 12:43:12 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 07/11] virtio-mem: Allow to offline partially
 unplugged memory blocks
Message-ID: <20200310114312.GG8447@dhcp22.suse.cz>
References: <20200302134941.315212-1-david@redhat.com>
 <20200302134941.315212-8-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302134941.315212-8-david@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Dave Young <dyoung@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
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

On Mon 02-03-20 14:49:37, David Hildenbrand wrote:
[...]
> +static void virtio_mem_notify_going_offline(struct virtio_mem *vm,
> +					    unsigned long mb_id)
> +{
> +	const unsigned long nr_pages = PFN_DOWN(vm->subblock_size);
> +	unsigned long pfn;
> +	int sb_id, i;
> +
> +	for (sb_id = 0; sb_id < vm->nb_sb_per_mb; sb_id++) {
> +		if (virtio_mem_mb_test_sb_plugged(vm, mb_id, sb_id, 1))
> +			continue;
> +		/*
> +		 * Drop our reference to the pages so the memory can get
> +		 * offlined and add the unplugged pages to the managed
> +		 * page counters (so offlining code can correctly subtract
> +		 * them again).
> +		 */
> +		pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
> +			       sb_id * vm->subblock_size);
> +		adjust_managed_page_count(pfn_to_page(pfn), nr_pages);
> +		for (i = 0; i < nr_pages; i++)
> +			page_ref_dec(pfn_to_page(pfn + i));

Is there ever situation this might be a different than 1->0 transition?
-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
