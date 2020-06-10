Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6C11F5D6B
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 22:55:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C58778754D;
	Wed, 10 Jun 2020 20:55:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yP-9MCY4GX8k; Wed, 10 Jun 2020 20:55:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CAAF1874EA;
	Wed, 10 Jun 2020 20:55:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6F1FC016F;
	Wed, 10 Jun 2020 20:55:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD6A7C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 20:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B2C942042B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 20:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMKTdOTYK3vv
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 20:55:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 4B6742041A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 20:55:00 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id s28so339214edw.11
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 13:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wkhkcPvpAeE4x4kAO1HjblduVWOEiZ+eHHO4eca07FY=;
 b=IgN05Fh0uREALZZU/s8t66dRm0ApTxlnvcL6Nnx/SwIGy9zTKN1m9HDCNywJFvcZ2U
 1xEVjk51dwqTD6l0sgKb+Vtjqr4s6SbTFzUJ0kDAKBXdGB7diNzJzQphVdL+BPgjm0Ga
 CNO9Wx8KMuwTuBeK1fJ+X3/7/j11L4DzwfyzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wkhkcPvpAeE4x4kAO1HjblduVWOEiZ+eHHO4eca07FY=;
 b=GyXndkPosHQVraaV0B/h3qMpJ0QoM2qtgnUS0P2rfZt6hwM+eCK45gmiggNCNjLvtW
 kJ1ni8klUVvQg2Sq1s1X84Vsx36drSqbYmPReXSRv4TAHsBkJ6P+0IPutsj1qaho+VdD
 NkJSn/+H6cm5Amt9J5xtO3jqOsumWvkGr3rENtXcgKNTb7bBncDkqKZslH1+mzMjj6DW
 cKscRnoX5IzbwmFEfhrMO7lYOuweZD350ZfhKDuO2Ekm+EQhCd6BSc7d4XSsy0cuFQ1d
 XlRYTT0Xouzj+DhyR8OiBE5yTIn1ONRTipFwuV1eRz9VnuBeN5cqj4YoX8NGI2we9xti
 723g==
X-Gm-Message-State: AOAM533IPyhSAHQknbUgH9waCxbPuvUjXwN+7M02Tgtp0VTF3bg6fV1i
 gTGeiNzqg5x3+oO4IU7IEU5O34skJmj/7w==
X-Google-Smtp-Source: ABdhPJzwdLQYcKvV4GsRYYXQ3WVl8V+Qwb8WhSXrUnKrlKKA7+xQ3B7BcDz7v6OKAmpDupVOVS3jbQ==
X-Received: by 2002:a05:6402:b87:: with SMTP id
 cf7mr4374410edb.282.1591822498144; 
 Wed, 10 Jun 2020 13:54:58 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51])
 by smtp.gmail.com with ESMTPSA id k9sm420492edl.83.2020.06.10.13.54.57
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 13:54:57 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id f7so4151309ejq.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 13:54:57 -0700 (PDT)
X-Received: by 2002:a2e:b5d7:: with SMTP id g23mr2510079ljn.70.1591822118508; 
 Wed, 10 Jun 2020 13:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200610004455-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200610004455-mutt-send-email-mst@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 10 Jun 2020 13:48:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiyR6X=SkHXMM3BWcePBryF4pmBNYMFWAnz5CfZwAp_Wg@mail.gmail.com>
Message-ID: <CAHk-=wiyR6X=SkHXMM3BWcePBryF4pmBNYMFWAnz5CfZwAp_Wg@mail.gmail.com>
Subject: Re: [GIT PULL] virtio: features, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: osalvador@suse.com, Michal Hocko <mhocko@suse.com>,
 KVM list <kvm@vger.kernel.org>, kernelfans@gmail.com,
 virtualization@lists.linux-foundation.org,
 Alexander Potapenko <glider@google.com>, teawaterz@linux.alibaba.com,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Herbert Xu <herbert@gondor.apana.org.au>, zou_wei@huawei.com,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Mike Rapoport <rppt@linux.ibm.com>, hulkci@huawei.com,
 Wei Yang <richard.weiyang@gmail.com>, clabbe@baylibre.com,
 anthony.yznaga@oracle.com, longpeng2@huawei.com,
 Oscar Salvador <osalvador@suse.de>, dyoung@redhat.com,
 Len Brown <lenb@kernel.org>, Pasha Tatashin <pavel.tatashin@microsoft.com>,
 pasha.tatashin@soleen.com, anshuman.khandual@arm.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qian Cai <cai@lca.pw>,
 stefanha@redhat.com, Dan Williams <dan.j.williams@intel.com>,
 Michal Hocko <mhocko@kernel.org>, lingshan.zhu@intel.com,
 Vlastimil Babka <vbabka@suse.cz>, kernel test robot <lkp@intel.com>,
 Juergen Gross <jgross@suse.com>, pankaj.gupta.linux@gmail.com,
 Netdev <netdev@vger.kernel.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, matej.genci@nutanix.com,
 Johannes Weiner <hannes@cmpxchg.org>, Rafael Wysocki <rafael@kernel.org>,
 imammedo@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>, David Miller <davem@davemloft.net>
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

On Tue, Jun 9, 2020 at 9:45 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
>   I also upgraded the machine I used to sign
> the tag (didn't change the key) - hope the signature is still ok. If not
> pls let me know!

All looks normal as far as I can tell,

                Linus
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
