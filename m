Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 715C42784FB
	for <lists.virtualization@lfdr.de>; Fri, 25 Sep 2020 12:22:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2CB1286C6C;
	Fri, 25 Sep 2020 10:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOSv5QVbUpZ7; Fri, 25 Sep 2020 10:22:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C0D8786C67;
	Fri, 25 Sep 2020 10:22:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2349C0889;
	Fri, 25 Sep 2020 10:22:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3C2BC0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 10:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A0CD586D54
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 10:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x+B5AGKV34Os
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 10:22:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E634886D3F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 10:22:30 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601029349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FIrDkYdRBbVhi3DlgkbBKaCC5KZCzUdxrIcyXtujywg=;
 b=bDGQN/Gj99UE09lCRriF229fGFdRbEWm1jTMID6zrgOGB19vGBfJ+Xl4XkD51cRohZJ64R
 DJubC+hxWZ0DitmuKmUStMwISTKwPhLdmSy68Kc0H0JUPyQNu5S60oM1LEiWBtqH+ETyRb
 iGOVN8SlF+8SAkmxQkG4MUcAW/bgyeQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-3_B3ylJhPge5j53hvUKjLw-1; Fri, 25 Sep 2020 06:22:25 -0400
X-MC-Unique: 3_B3ylJhPge5j53hvUKjLw-1
Received: by mail-wm1-f71.google.com with SMTP id a25so665828wmb.2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 03:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FIrDkYdRBbVhi3DlgkbBKaCC5KZCzUdxrIcyXtujywg=;
 b=ncgKDoYzWCbmkxpOeFZ6ZpCi1ytegg0HzOH9y6Ev+bgIrk6bEc8neBcfJOVLnxfWUN
 sgnIIq+X6GBlX/VRoKWxEq7w/TzKRNyyy4zAzjlIjh8S2g6w/dReTeKZOTqfHPc1mgAC
 C8fkiB/TDqg0drpcxGguzX5HkK/on/LSOpVn7UmsZ5bJDuOG/WOFNnJfaAoooSm2iM95
 jReNmBz0yOh4nKXo23f6FRE3mhfu4GkYnVg8AgfphEB8f03cku5D36JEAf3pVveCj12a
 qUnYjkzO/n4vZcFrxCFNT5JFoLtxf3/4Gfa+wbWAHdBgD9SRnPO95FBNVKNWSy5ZYvmA
 EMZg==
X-Gm-Message-State: AOAM530hTfDTdz/kJKApwpVuxIq66fciVRY7Yp3jXreO0Ymwl5aVw3m4
 rJatjfspyA5Fh1dN2Io4Bie7iNAWis6XfElyzbNf4i0Ou5hHsvTpz8qXL4vlVld4vvU1aqsyJM+
 rrnIIjbAjjjlI2+B1L8BUo2qXa99xDaU4Z/RU9OXrJw==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr2311720wme.136.1601029344196; 
 Fri, 25 Sep 2020 03:22:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/J1hHVBw+R8oMJc/+peFSRFq7cwzBLkEQMc+s1atOIZTdN1uBg5mFmmxkcJWGpJb6G3bMjg==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr2311686wme.136.1601029343977; 
 Fri, 25 Sep 2020 03:22:23 -0700 (PDT)
Received: from redhat.com (bzq-79-179-71-128.red.bezeqint.net. [79.179.71.128])
 by smtp.gmail.com with ESMTPSA id c14sm2297007wrv.12.2020.09.25.03.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 03:22:23 -0700 (PDT)
Date: Fri, 25 Sep 2020 06:22:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 0/6] Add virtio-iommu built-in topology
Message-ID: <20200925062122-mutt-send-email-mst@kernel.org>
References: <20200821131540.2801801-1-jean-philippe@linaro.org>
 <ab2a1668-e40c-c8f0-b77b-abadeceb4b82@redhat.com>
 <20200924045958-mutt-send-email-mst@kernel.org>
 <20200924092129.GH27174@8bytes.org>
 <20200924053159-mutt-send-email-mst@kernel.org>
 <20200924100255.GM27174@8bytes.org>
 <20200924083918-mutt-send-email-mst@kernel.org>
 <20200924125046.GR27174@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <20200924125046.GR27174@8bytes.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, lorenzo.pieralisi@arm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-pci@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Auger Eric <eric.auger@redhat.com>,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 bhelgaas@google.com
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

On Thu, Sep 24, 2020 at 02:50:46PM +0200, Joerg Roedel wrote:
> On Thu, Sep 24, 2020 at 08:41:21AM -0400, Michael S. Tsirkin wrote:
> > But this has nothing to do with Linux.  There is also no guarantee that
> > the two committees will decide to use exactly the same format. Once one
> > of them sets the format in stone, we can add support for that format to
> > linux. If another one is playing nice and uses the same format, we can
> > use the same parsers. If it doesn't linux will have to follow suit.
> 
> Or Linux decides to support only one of the formats, which would then be
> ACPI.
> 
> Regards,
> 
> 	Joerg

It's really up to hypervisors not guests, linux as a guest can for sure
refuse to work somewhere, but that's normally not very attractive.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
