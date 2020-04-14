Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A3A1A84DD
	for <lists.virtualization@lfdr.de>; Tue, 14 Apr 2020 18:28:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B1DCD84DDC;
	Tue, 14 Apr 2020 16:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6rHgdeP1Pr3c; Tue, 14 Apr 2020 16:28:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CA5DE84977;
	Tue, 14 Apr 2020 16:28:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B082CC1D8D;
	Tue, 14 Apr 2020 16:28:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15EAEC0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 03E728329B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8bSl20XMxJ9Y
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:28:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3900E827BD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586881729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mjWxSbfmmzPB+9cl5oT2tFJutn094jI8t91pgbfl/bY=;
 b=SDgTYE7CITTW+8WNLGjfkjBiW4fN/6j1RKaWmcTFos25abYlRlB8RkZx312yQnil3+p+HG
 KNpXTJymA1a7UdjXsMrOzreKuwAiyiyR+rI+mMfotNmXNJ6fXwzOZlFB8puVF38fDD5Fx1
 RtM2QNwBR6u4rVjp3802EXjtQQB0g44=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-IAuFx3UsNEaz7Xv6usZvpg-1; Tue, 14 Apr 2020 12:28:46 -0400
X-MC-Unique: IAuFx3UsNEaz7Xv6usZvpg-1
Received: by mail-qk1-f199.google.com with SMTP id r129so6179436qkd.19
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 09:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mjWxSbfmmzPB+9cl5oT2tFJutn094jI8t91pgbfl/bY=;
 b=bMkjlHYkRw23hiT7C30YiSPmTJgzgdT7m2tZ8PThxXtTCfQxXvHSybn+7XkPJeajKy
 0dmva7+MAviwb3Mdi70Ht9+eeG7qaOuuaPZObuKN3h6lfwrl1A7Ll9F7eKCQt0gwaY4J
 YxnfDJwsmd0lzmOhPS/JxtKApv/nY014/VX4xpKwNOmR4iEAxe31HiNV7AQIeACqE3t5
 8fRNUbrylUIQmbVyNMNTpqQyGvH5dOn90W7QMs7RuPCVDarFoEpwX005uu9deTbOweB3
 9QrxoUuvfvDXmWyLaixaVJjzRmEtHpM00/mJZSSDCx233Q/DUL5eKCJJgv8PfPv3XGfe
 UMUw==
X-Gm-Message-State: AGi0PuZI27Zg2Gph5tVp5Q1fnJ6Clo5Rk1NQ8GO085J4OjcRBrq2cpLg
 GzFj2umvelZ8lSZUtz+KaZCexQqCkihoAqXa73igNApyGdHpuPfOZY1CSfArvGfhD8OCgI6nDQA
 Wnm8gvsepZaAXxq7Z2nLmrL2VYnj3a7fIBMrGz1Yzqw==
X-Received: by 2002:ac8:6043:: with SMTP id k3mr15295327qtm.99.1586881725610; 
 Tue, 14 Apr 2020 09:28:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ4y/Xa4C4HgHuCyuPRYI8NOYdTc8eSgKzUQlVgQoEI+PhLHm/qmH5N/f+tJAy3tV4SwX5BzQ==
X-Received: by 2002:ac8:6043:: with SMTP id k3mr15295280qtm.99.1586881725363; 
 Tue, 14 Apr 2020 09:28:45 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id o22sm371970qtm.90.2020.04.14.09.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 09:28:44 -0700 (PDT)
Date: Tue, 14 Apr 2020 12:28:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 00/10] virtio-mem: paravirtualized memory
Message-ID: <20200414122716-mutt-send-email-mst@kernel.org>
References: <20200311171422.10484-1-david@redhat.com>
 <20200329084128-mutt-send-email-mst@kernel.org>
 <b9984195-bb48-e2a6-887d-0905692a7524@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b9984195-bb48-e2a6-887d-0905692a7524@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 Robert Bradford <robert.bradford@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Pingfan Liu <kernelfans@gmail.com>,
 Luiz Capitulino <lcapitulino@redhat.com>, linux-mm@kvack.org,
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
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Juergen Gross <jgross@suse.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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

On Tue, Apr 14, 2020 at 11:15:18AM +0200, David Hildenbrand wrote:
> On 29.03.20 14:42, Michael S. Tsirkin wrote:
> > On Wed, Mar 11, 2020 at 06:14:12PM +0100, David Hildenbrand wrote:
> >> This series is based on latest linux-next. The patches are located at:
> >>     https://github.com/davidhildenbrand/linux.git virtio-mem-v2
> >>
> >> I now have acks for all !virtio-mem changes. I'll be happy to get review
> >> feedback, testing reports, etc. for the virtio-mem changes. If there are
> >> no further comments, I guess this is good to go as a v1 soon.
> > 
> > I'd like to queue it for merge after the release. If you feel it's ready
> > please ping me after the release to help make sure it didn't get
> > dropped.  I see there were some reports about people having trouble
> > using this, pls keep working on this meanwhile.
> 
> Hi Michael,
> 
> I think this is ready to go as a first version. There are a couple of
> future work items related to kexec/kdump:
> - Teach kexec-tools/kexec_file_load() to not place the kexec
>   kernel/initrd onto virtio-mem added memory.
> - Teach kexec-tools/kdump to consider a bigger number of memory
>   resources for dumping.
> 
> In general, as virtio-mem adds a lot of memory resources, we might want
> to tweak performance in that area as well. Future stuff.
> 
> So I suggest queuing this. If you need a resend, please let me know.
> 
> Cheers!

Thanks!
I'll queue it for merge after the release. If possible please ping me
after the release to help make sure it didn't get dropped.




> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
