Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F27201762AC
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 19:29:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A1917204B7;
	Mon,  2 Mar 2020 18:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKaGpM6wlDYu; Mon,  2 Mar 2020 18:29:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C04E6204B4;
	Mon,  2 Mar 2020 18:29:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9324AC013E;
	Mon,  2 Mar 2020 18:29:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C34C2C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 18:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B0000204A4
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 18:29:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQd76Z5aJbRH
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 18:29:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by silver.osuosl.org (Postfix) with ESMTPS id C90B01FFFF
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 18:29:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a141so123185wme.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 10:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hKkgF2JN7gykCZKvbDhRvANS70H1+8HoXvuiM9rtoLA=;
 b=OrJ2TGYIcWo9fSG+mQdji6+lyiICSvMOzT4ENDF+JLRZ592dYJRIF0xUA7jqWJ19rK
 8Qw9Vk4vSbK9ou2lTmzwD1QG28HcxAV52GKT9ZORM7N4cPppg8+l34Ctm8udtxT8b57F
 2aeS9wnZC9+w89bJovazIZOyHDcGD4wyJEEqDD+LWqBVJq0F4oUx/mO9GLsLPatAhvdO
 e555/VZ+SWJur6r2pbeEf0DINKl09HQly/K4svfH44iGM6YVLE7Uv5tf6aKi4xPbM7uC
 4c4+J8IhUl5rpulnJy2XKDg9JwcYCtaHy/bjscTzBaX5jlTbfgj8qo5nTL8dZZNC9jRc
 0N9Q==
X-Gm-Message-State: ANhLgQ2J7QhQP7WPQaoq3QzjsnLGJSyzpQYTPehrdAYBh+SlYBqavDXr
 IujPPJ0SSE9Cv0VkHU5hmLQ=
X-Google-Smtp-Source: ADFU+vuD+iUqdIsN7GsQwMdgoFIg5mjnb/d3Y1e+SHBuYQQus1FBM/XQRItFBGMXPRhig1FWUl0HpQ==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr330579wmi.21.1583173764395;
 Mon, 02 Mar 2020 10:29:24 -0800 (PST)
Received: from localhost (ip-37-188-163-134.eurotel.cz. [37.188.163.134])
 by smtp.gmail.com with ESMTPSA id j5sm29915868wrw.24.2020.03.02.10.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 10:29:23 -0800 (PST)
Date: Mon, 2 Mar 2020 19:29:22 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 00/11] virtio-mem: paravirtualized memory
Message-ID: <20200302182922.GT4380@dhcp22.suse.cz>
References: <20200302134941.315212-1-david@redhat.com>
 <7f8a9225-99f2-b00d-241f-ef934395c667@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f8a9225-99f2-b00d-241f-ef934395c667@redhat.com>
Cc: Oscar Salvador <osalvador@suse.com>,
 Robert Bradford <robert.bradford@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Pingfan Liu <kernelfans@gmail.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Wei Yang <richard.weiyang@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Dave Young <dyoung@redhat.com>,
 Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Qian Cai <cai@lca.pw>,
 Stefan Hajnoczi <stefanha@redhat.com>, Samuel Ortiz <samuel.ortiz@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Luiz Capitulino <lcapitulino@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>
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

On Mon 02-03-20 19:15:09, David Hildenbrand wrote:
[...]
> As requested by Michal, I will squash some patches.

Just to clarify. If I am the only one to care then do not bother.
Btw. I still have patch 6 on the todo list to review. I just didn't find
time for it today.

-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
