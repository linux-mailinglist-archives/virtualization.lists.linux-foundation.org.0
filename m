Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E5A37124A
	for <lists.virtualization@lfdr.de>; Mon,  3 May 2021 10:11:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C974460B34;
	Mon,  3 May 2021 08:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id risDptN8zf77; Mon,  3 May 2021 08:11:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id A96A160B36;
	Mon,  3 May 2021 08:11:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5227DC0001;
	Mon,  3 May 2021 08:11:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01CBBC0001
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 08:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD50E40467
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 08:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TFceQVHOLkd
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 08:11:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26896400D0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620029496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwlHSyZzbGf/1hjjeGeNUgRrxHpiQEqHNLs9/p1ggRw=;
 b=SpnB4wOZYRjWRsZw6CbE6Mx+Vg7HJD6WzRgcfwSky3w5fpAeccqaq2UILjxONahJt3dIqY
 I3rJqAEAihRNarxzQCsVmFZyrKXO6ks++dnv4T+m+Yfo8J5VdHUDu5L17xvNn3pQ/B/4i0
 Xn0AOH9P/eW6AdoYxo/KBkyxXtjPimA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-pOQ1m4wJOPONaj-2WgL4dw-1; Mon, 03 May 2021 04:11:32 -0400
X-MC-Unique: pOQ1m4wJOPONaj-2WgL4dw-1
Received: by mail-ed1-f69.google.com with SMTP id
 y15-20020aa7d50f0000b02903885ee98723so4050463edq.16
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 May 2021 01:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vwlHSyZzbGf/1hjjeGeNUgRrxHpiQEqHNLs9/p1ggRw=;
 b=niL2gjkpXVlNQzVwCzK4vp3qgBXj4LUjj1TuV7k9pJvOsaxgGQRrriB2y1AvZlxMeM
 iyqvpUL2NC3pfjwfAAzoBQhOWziGMVkR2Cqexcjre1Twcggy+6N378Z/w4dAkPqs2xLV
 dbmBfWLwbTMV+rRHl3qWnhANonpFIl4fR83Bw3hxX8msRz2zYo4DfkUScdigU9/q1flr
 PnurcrBaMEo9S6byvWNC1yRNSlGuIFggUtX6NBIvcmma8PSkmzaTNGv3iKp6DrC08Fs7
 rRcU0jajlhLbTCQfArmQ7vVpW7v0HsEduYvBwT/HNByLt8PNZbJ6WGUDvZu9X+bCnTHm
 GjAQ==
X-Gm-Message-State: AOAM532r8MWrWDPezDgEjRBr25j4l03K2e0Lcr1NgmsX7oJm8Nbehoy2
 DICER50+GDleG6DmEC7d3yj96AqGCaoPIjoHiWdNj+6yEohH8qGkVFNCqnxR4kHEqSI4HSBRqjx
 p9TbgzHX29YXyDEPqKKhxLbffix6LffbAhRkaPQ8eXQ==
X-Received: by 2002:a50:eb47:: with SMTP id z7mr16986475edp.68.1620029491000; 
 Mon, 03 May 2021 01:11:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgC+bCNFZ6IjQ+hZxVb6PiUEspf4Kwd7KdWnjG2fBIRF7s94xAa5mK0csiH8ddS3w5cQDqaA==
X-Received: by 2002:a50:eb47:: with SMTP id z7mr16986454edp.68.1620029490784; 
 Mon, 03 May 2021 01:11:30 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c649f.dip0.t-ipconnect.de. [91.12.100.159])
 by smtp.gmail.com with ESMTPSA id d15sm12268494edu.86.2021.05.03.01.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 01:11:30 -0700 (PDT)
Subject: Re: [PATCH v1 5/7] mm: introduce
 page_offline_(begin|end|freeze|unfreeze) to synchronize setting PageOffline()
To: Mike Rapoport <rppt@kernel.org>
References: <20210429122519.15183-1-david@redhat.com>
 <20210429122519.15183-6-david@redhat.com> <YI5Hp49AmWgfTzNy@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <4aa55978-c224-7ead-f00d-df1a6c3dfda4@redhat.com>
Date: Mon, 3 May 2021 10:11:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YI5Hp49AmWgfTzNy@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Aili Yao <yaoaili@kingsoft.com>, Michal Hocko <mhocko@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Wei Liu <wei.liu@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Steven Price <steven.price@arm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Jiri Bohac <jbohac@suse.cz>, Haiyang Zhang <haiyangz@microsoft.com>,
 Oscar Salvador <osalvador@suse.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 02.05.21 08:33, Mike Rapoport wrote:
> On Thu, Apr 29, 2021 at 02:25:17PM +0200, David Hildenbrand wrote:
>> A driver might set a page logically offline -- PageOffline() -- and
>> turn the page inaccessible in the hypervisor; after that, access to page
>> content can be fatal. One example is virtio-mem; while unplugged memory
>> -- marked as PageOffline() can currently be read in the hypervisor, this
>> will no longer be the case in the future; for example, when having
>> a virtio-mem device backed by huge pages in the hypervisor.
>>
>> Some special PFN walkers -- i.e., /proc/kcore -- read content of random
>> pages after checking PageOffline(); however, these PFN walkers can race
>> with drivers that set PageOffline().
>>
>> Let's introduce page_offline_(begin|end|freeze|unfreeze) for
> 
> Bikeshed: freeze|thaw?
>

Sure :)


-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
