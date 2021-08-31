Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DFD3FCE34
	for <lists.virtualization@lfdr.de>; Tue, 31 Aug 2021 22:12:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD3D540704;
	Tue, 31 Aug 2021 20:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fDL_nPFgGBAw; Tue, 31 Aug 2021 20:12:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B226D406FE;
	Tue, 31 Aug 2021 20:12:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FC45C000E;
	Tue, 31 Aug 2021 20:12:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5B41C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 20:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C19FA406FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 20:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Km8hR0_L1em
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 20:12:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D137406FD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 20:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630440722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KbgJ2Vu8JpD26GA6OCHo87Wy3/ZN8Be3JYXsPNbuv+A=;
 b=dPzS/KxZuvbhqgYRqmtzGrHRbSvD0TLuCiHS1J7SyxE76rzLchGZurRdyM5zrokWj84pSF
 px2Vihe9M2Iuk80XychrhRQiptqTYzJ1EKV5MtnUdowpkoh1dHjFEXF9fvuOgAtqPDEs9G
 vyi1OX5r8NzeESmSMO87HXJGRvTP0rQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-3VPv1665PLexAX2tIbhpSA-1; Tue, 31 Aug 2021 16:10:43 -0400
X-MC-Unique: 3VPv1665PLexAX2tIbhpSA-1
Received: by mail-wm1-f69.google.com with SMTP id
 y24-20020a7bcd98000000b002eb50db2b62so120778wmj.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 13:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KbgJ2Vu8JpD26GA6OCHo87Wy3/ZN8Be3JYXsPNbuv+A=;
 b=ipCauOFoSoNZW1ZETzezxQCTDtbwIl29MHXM3VMbgV1y+ZeBuFduoaUr+o0rLW9ucb
 oIr9hQXIULkWSgaDAgKdYeomA7YDcx6vitHeV3qRl+5bLLW6fzuE3pAgNdZgPo/RWctM
 gXqi52MaacTStttMIRVwjBvC+HG+nLJzsxqspXbEBHt0s2tyttm5jWZNcYfVc1BIsQgI
 +nNz3gZ691KwaFuI9fxspyQ01z1SAi3zdSs/G4ty3W2f5pxzcrM/uBfIlOaS2pa94h7X
 Gp8QC05K3rCuLzSBhz3ZllJjuXrovb0lgWoMMlry55EKTbfudrfI2Jy1outyHGpuesPA
 +dSw==
X-Gm-Message-State: AOAM530lK5b9AvT9Tb+bGwYl1MA2dcXMef3wz3iB9/JKTmUj/2A55dto
 NhbJ7lr4J1vkyh8az4eWLimBQKsbyJYznuxzsjVcQROjozRuDJzzfxbvTRD0RbvdS0+O8ziaRCN
 1/Iuh5ZxwGy5UaF5KSu9HjsP2AksVrJQjRAecrxwlUg==
X-Received: by 2002:adf:edc2:: with SMTP id v2mr33399001wro.255.1630440642150; 
 Tue, 31 Aug 2021 13:10:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFHxJK6CuUyH4fIACh8WCgho8ld2f48k7iz12CJXT9s8M02Pmju/iUqJTv/KchgQNGbkL+Og==
X-Received: by 2002:adf:edc2:: with SMTP id v2mr33398977wro.255.1630440641934; 
 Tue, 31 Aug 2021 13:10:41 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23bf5.dip0.t-ipconnect.de. [79.242.59.245])
 by smtp.gmail.com with ESMTPSA id u23sm3315346wmc.24.2021.08.31.13.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 13:10:41 -0700 (PDT)
Subject: Re: [GIT PULL] virtio: a last minute fix
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210829115343-mutt-send-email-mst@kernel.org>
 <CAHk-=wjYkPWoQWZEHXzd3azugRO4MCCEx9dBYKkVJLrk+1gsMg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <6aaa0ca9-61ed-7ea3-de61-56dcd04ce88b@redhat.com>
Date: Tue, 31 Aug 2021 22:10:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjYkPWoQWZEHXzd3azugRO4MCCEx9dBYKkVJLrk+1gsMg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: KVM list <kvm@vger.kernel.org>, tiny.windzz@gmail.com,
 Netdev <netdev@vger.kernel.org>, liang.z.li@intel.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, mst@redhat.com,
 Andrew Morton <akpm@linux-foundation.org>, hch@lst.de,
 Dan Carpenter <dan.carpenter@oracle.com>
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

On 29.08.21 20:11, Linus Torvalds wrote:
> On Sun, Aug 29, 2021 at 8:53 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> Donnu if it's too late - was on vacation and this only arrived
>> Wednesday. Seems to be necessary to avoid introducing a regression
>> in virtio-mem.
> 
> Heh. Not too late for 5.14, but too late in the sense that I had
> picked this one up manually already as commit 425bec0032f5
> ("virtio-mem: fix sleeping in RCU read side section in
> virtio_mem_online_page_cb()").

Thanks Michael for sending this last minute and thanks Linus for picking 
it up independently early! Awesome :)

-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
