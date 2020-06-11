Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCE71F66F0
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 13:41:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E9A9D88725;
	Thu, 11 Jun 2020 11:41:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1kwr8v8FtGM; Thu, 11 Jun 2020 11:41:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 39B968872B;
	Thu, 11 Jun 2020 11:41:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1571AC016F;
	Thu, 11 Jun 2020 11:41:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E27AC0865
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 48D8284AE1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aBkPi1bRZKfO
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:41:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B267E879D7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591875679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N+hOhqTQBMwp4AmRlzbOHmDQ8McxlMKMKGqAqlXUfCE=;
 b=CdoDIF+KrNGLpI3MM+KrTsH4w1jjysPL1hgIWrKYkGgqYg0rpc1AfrGoClBWNlU/vza56w
 WgX0J7vgrUeneyOa3oPrYMdY73p1ftRX0ytn/uVwemitHjywqpci6ERPXGeVESL7f8tXi/
 dFBQcG8pIRrFkeJvV3T9cNF0Cl9RAM4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-4SHBrpkUN9OC73i_fe797Q-1; Thu, 11 Jun 2020 07:41:18 -0400
X-MC-Unique: 4SHBrpkUN9OC73i_fe797Q-1
Received: by mail-wr1-f71.google.com with SMTP id m14so2456368wrj.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 04:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N+hOhqTQBMwp4AmRlzbOHmDQ8McxlMKMKGqAqlXUfCE=;
 b=GvUxf3AaGy/Mg9t2KC3joE2tSmlWhl+TeNt0q0LTZhHnmvjLtqym8GmWsQxunqTpoJ
 UOT891zEBEPkZE2xHJyLYImkXJekuu+PxtfXefJgKL2ow9FqheAS+t13Hjemypa5hR4F
 qSlhCcfjBnhRqjCAE8SsKp/tWLEgY0X3eK+vDXJxFsL7aXNAJJxbgvgyctUwmD2aj0JC
 Wl9FDuObtr+9tt2mHOu6i66aFuyBXDHDZIrBWtSxEj1hkqf7/2H1UgzjOobAPoNWOPSD
 QxygedWBborIthCYKu7MGySPPE+oltLOx2bJnq1OnJRl2amEPvNERXQYHtqWgZVB4Cgr
 YmLQ==
X-Gm-Message-State: AOAM531MVowqjz4CenekCZ8DAdLfgFDlGmVNXo9/ypfeS2dsA829sUzk
 rQdfMECTCerrLqSU3vIXKy5N8C7y19f8py0cvaq2lFvmEvDcnrqhQYOiLlLIHBWGxS7Bt48AWxF
 4ikBylIeLEtooZfQS/Ndm4OhLwzbdfisVFOQeBxKXOg==
X-Received: by 2002:a7b:c40e:: with SMTP id k14mr8259487wmi.59.1591875676952; 
 Thu, 11 Jun 2020 04:41:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkpzm1AHXvvYbOTpCzrh8Us+16Cfza99czVInZxHNWwmzLaKoW7HIE1UmlxalWp27taecVCA==
X-Received: by 2002:a7b:c40e:: with SMTP id k14mr8259469wmi.59.1591875676754; 
 Thu, 11 Jun 2020 04:41:16 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id g3sm5069764wrb.46.2020.06.11.04.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 04:41:16 -0700 (PDT)
Date: Thu, 11 Jun 2020 07:41:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] virtio-mem: add memory via add_memory_driver_managed()
Message-ID: <20200611073943-mutt-send-email-mst@kernel.org>
References: <20200611071744-mutt-send-email-mst@kernel.org>
 <613382D2-5F4D-4A32-AC8E-E1D03240036F@redhat.com>
MIME-Version: 1.0
In-Reply-To: <613382D2-5F4D-4A32-AC8E-E1D03240036F@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 teawater <teawaterz@linux.alibaba.com>
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

On Thu, Jun 11, 2020 at 01:33:04PM +0200, David Hildenbrand wrote:
> 
> 
>     Am 11.06.2020 um 13:18 schrieb Michael S. Tsirkin <mst@redhat.com>:
> 
> 
>     On Thu, Jun 11, 2020 at 01:00:24PM +0200, David Hildenbrand wrote:
> 
>                 I'd like to have this patch in 5.8, with the initial merge of
>                 virtio-mem
> 
>                 if possible (so the user space representation of virtio-mem
>                 added memory
> 
>                 resources won't change anymore).
> 
>            
> 
>             So my plan is to rebase on top of -rc1 and merge this for rc2 then.
> 
>             I don't like rebase on top of tip as the results are sometimes kind
>             of
> 
>             random.
> 
>        
> 
>         Right, I just wanted to get this out early so we can discuss how to
>         proceed.
> 
>        
> 
>             And let's add a Fixes: tag as well, this way people will remember
>             to
> 
>             pick this.
> 
>             Makes sense?
> 
>        
> 
>         Yes, it's somehow a fix (for kexec). So
> 
>        
> 
>         Fixes: 5f1f79bbc9e26 ("virtio-mem: Paravirtualized memory hotplug")
> 
>        
> 
>         I can respin after -rc1 with the commit id fixed as noted by Pankaj.
> 
>         Just let me know what you prefer.
> 
>        
> 
>         Thanks!
> 
>    
>     Some once this commit is in Linus' tree, please ping me.
> 
> 
> It already is as mentioned, only the id was wrong.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=
> 7b7b27214bba1966772f9213cd2d8e5d67f8487f

OK I pushed this into next based on tip. Let's see what happens.


> 
>    
> 
>         --
> 
>         Thanks,
> 
>        
> 
>         David / dhildenb
> 
>    
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
