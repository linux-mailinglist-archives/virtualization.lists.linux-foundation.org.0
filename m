Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A1C17F6F5
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 13:00:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7407A860F6;
	Tue, 10 Mar 2020 12:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MIhi038FX1Wo; Tue, 10 Mar 2020 12:00:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F0E19860D1;
	Tue, 10 Mar 2020 11:59:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7D02C0177;
	Tue, 10 Mar 2020 11:59:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D855FC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CF511203B8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qst+9fgsYk5b
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:59:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by silver.osuosl.org (Postfix) with ESMTPS id CD2AD203A7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:59:57 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m3so1045328wmi.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 04:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0bAhm3DuaLfkzUm2lkD/QpZIHlNuTATTEEtwUNoLDMc=;
 b=Dluox6esRS3+tM94nyPxICZFetTbtHGyRSWmgV1C5svN1Zjemo+uvTEDf+C5rmPjal
 SToKI+bYU9iDwecZonwS+qGjHYXVF5e7sKV7LKSgWVFEuuuIFTXI5unr8vyGiufYPiHC
 1dM3fdfsJhC9FFFOt1Ck4n5D+6kT6Ye6tnUEFesc8wGnkFPrmy77Se1vh5yAuL5WjhNM
 wySTC/OqpRYkHGrSSUFzZ8hEdUKvlgZNruaxUUqUyzpYYOwADl/ocr4bPMM7LRdYHepL
 GZdRo+xjuMwXZofvRqOB57FsayM3JEO82/ll9QWczfWIl5ospT1J8exPjebNe13unODT
 FEAw==
X-Gm-Message-State: ANhLgQ1FCIcuTiooumqG8IDZvbHDmY9+5hoVfwk6LO27wzpDU/S3C8pp
 TsXP8wjNiv7VMdEWxsGmHnc=
X-Google-Smtp-Source: ADFU+vuTmNn8vy4JGsoYYV4PMEgdh1palpn0A7Ri4XkzIOQ/sbHDPtvrJg+BmE/NgDS3Qt080LephA==
X-Received: by 2002:a7b:c20c:: with SMTP id x12mr1914581wmi.80.1583841596287; 
 Tue, 10 Mar 2020 04:59:56 -0700 (PDT)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id m21sm3763917wmi.27.2020.03.10.04.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 04:59:55 -0700 (PDT)
Date: Tue, 10 Mar 2020 12:59:55 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 07/11] virtio-mem: Allow to offline partially
 unplugged memory blocks
Message-ID: <20200310115955.GI8447@dhcp22.suse.cz>
References: <20200302134941.315212-1-david@redhat.com>
 <20200302134941.315212-8-david@redhat.com>
 <20200310114312.GG8447@dhcp22.suse.cz>
 <e505b4cb-1d12-d6e6-3524-9dfa65ae34bf@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e505b4cb-1d12-d6e6-3524-9dfa65ae34bf@redhat.com>
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

On Tue 10-03-20 12:46:05, David Hildenbrand wrote:
> On 10.03.20 12:43, Michal Hocko wrote:
> > On Mon 02-03-20 14:49:37, David Hildenbrand wrote:
> > [...]
> >> +static void virtio_mem_notify_going_offline(struct virtio_mem *vm,
> >> +					    unsigned long mb_id)
> >> +{
> >> +	const unsigned long nr_pages = PFN_DOWN(vm->subblock_size);
> >> +	unsigned long pfn;
> >> +	int sb_id, i;
> >> +
> >> +	for (sb_id = 0; sb_id < vm->nb_sb_per_mb; sb_id++) {
> >> +		if (virtio_mem_mb_test_sb_plugged(vm, mb_id, sb_id, 1))
> >> +			continue;
> >> +		/*
> >> +		 * Drop our reference to the pages so the memory can get
> >> +		 * offlined and add the unplugged pages to the managed
> >> +		 * page counters (so offlining code can correctly subtract
> >> +		 * them again).
> >> +		 */
> >> +		pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
> >> +			       sb_id * vm->subblock_size);
> >> +		adjust_managed_page_count(pfn_to_page(pfn), nr_pages);
> >> +		for (i = 0; i < nr_pages; i++)
> >> +			page_ref_dec(pfn_to_page(pfn + i));
> > 
> > Is there ever situation this might be a different than 1->0 transition?
> 
> Only if some other code would be taking a reference. At least not from
> virtio-mem perspective.

OK, so that is essentially an error condition. I think it shouldn't go
silent and you want something like
	if (WARN_ON(!page_ref_sub_and_test(page)))
		dump_page(pfn_to_page(pfn + i), "YOUR REASON");

-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
