Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EB6182B87
	for <lists.virtualization@lfdr.de>; Thu, 12 Mar 2020 09:47:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C44F285F88;
	Thu, 12 Mar 2020 08:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w6G5xxRcuyJ3; Thu, 12 Mar 2020 08:47:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6121B85F8A;
	Thu, 12 Mar 2020 08:47:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34E24C0177;
	Thu, 12 Mar 2020 08:47:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54FE3C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 08:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 50300226F3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 08:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dlNhvVQ7Acvt
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 08:47:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 5DCAD226CA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 08:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584002843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CMGY5NDRnQ6tpPW4NbzkE3whOpE1haBikjv6YCfDFio=;
 b=Fo0ikYqR+VVs9A598R0Wb4nPouabgcDizciljvDiGihXgpVyW9L0jbVDAcNS2X+tCZNjbg
 MKOgBDx064NdFcto+T0PKwf2xAbcBiAv8UOIrbQfcLtxV4FRIkO2My+C4Rsrh8shfwcZJP
 7iPuyV3vCE4YdLEJw3xx1s4QMaPUx8s=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-EioFA3u3P-mFb2xdWSxUpg-1; Thu, 12 Mar 2020 04:47:19 -0400
X-MC-Unique: EioFA3u3P-mFb2xdWSxUpg-1
Received: by mail-qv1-f69.google.com with SMTP id y11so603098qvx.22
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 01:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CMGY5NDRnQ6tpPW4NbzkE3whOpE1haBikjv6YCfDFio=;
 b=hmQAXRTVnrXoS9DtPdmCTjVxqb/7Bemi3XZnqhA/wLk8c5wZ1nN5dU4TnrREX6bE3U
 ZrkuvG62uoLZvY7b4WqB57xJJN/mPI4zKXIioPgvLF6isECDY6M4DptLov5BQa9Bj9QM
 KqqRwuXvo+C7KVhbbmbobfdjxyEf3Td2Q4i3Y4J3bLHCzIz+LWhMwW+PLV73ly+rvhhd
 mQNWYzdv+NVF4jJ4BI0/ICErtRHZTx5I8WHKZwN5c70Jp4Kyp13KZRsP6EHvXeTSSUzq
 Laxq3MV2A9kZ4BnZqHEBVmWE6raUdJolkIZmf6kW5kT8LklXVBOrLMBc3oqTjkBN2YzB
 5ycg==
X-Gm-Message-State: ANhLgQ2XvKwTlD5VOutAeiC1Tfv6q7rMFRJl7bl1hNvmYGYuc6REHpUM
 tKEtCL4R9gRhb8ZvJHHaXTDRyNDFHGEG0fhcm56cL2D/WRnVGUiswCuNEJYG4+uL5ylTmkAOhZB
 wUH1O75OFmsCxmMgxfzE0msGoUxbrXKVKz2QQKVBWLA==
X-Received: by 2002:ac8:70d4:: with SMTP id g20mr6375495qtp.146.1584002838849; 
 Thu, 12 Mar 2020 01:47:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsV2vB8jgT9lPTI6/rXChnARxotlD8arZEu0o0XGFcCreqdYk31/Dsq3r3lSxfUv0vOD7Pnvw==
X-Received: by 2002:ac8:70d4:: with SMTP id g20mr6375478qtp.146.1584002838612; 
 Thu, 12 Mar 2020 01:47:18 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id c190sm5213470qkb.80.2020.03.12.01.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 01:47:17 -0700 (PDT)
Date: Thu, 12 Mar 2020 04:47:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER
 to handle THP spilt issue
Message-ID: <20200312043859-mutt-send-email-mst@kernel.org>
References: <1583999395-9131-1-git-send-email-teawater@gmail.com>
 <3e1373f4-6ade-c651-ddde-6f04e78382f9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3e1373f4-6ade-c651-ddde-6f04e78382f9@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: pagupta@redhat.com, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 qemu-devel@nongnu.org, mojha@codeaurora.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, namit@vmware.com,
 Hui Zhu <teawaterz@linux.alibaba.com>, akpm@linux-foundation.org,
 Hui Zhu <teawater@gmail.com>
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

On Thu, Mar 12, 2020 at 09:37:32AM +0100, David Hildenbrand wrote:
> 2. You are essentially stealing THPs in the guest. So the fastest
> mapping (THP in guest and host) is gone. The guest won't be able to make
> use of THP where it previously was able to. I can imagine this implies a
> performance degradation for some workloads. This needs a proper
> performance evaluation.

I think the problem is more with the alloc_pages API.
That gives you exactly the given order, and if there's
a larger chunk available, it will split it up.

But for balloon - I suspect lots of other users,
we do not want to stress the system but if a large
chunk is available anyway, then we could handle
that more optimally by getting it all in one go.


So if we want to address this, IMHO this calls for a new API.
Along the lines of

	struct page *alloc_page_range(gfp_t gfp, unsigned int min_order,
					unsigned int max_order, unsigned int *order)

the idea would then be to return at a number of pages in the given
range.

What do you think? Want to try implementing that?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
