Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C346217A902
	for <lists.virtualization@lfdr.de>; Thu,  5 Mar 2020 16:39:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 72DB32153B;
	Thu,  5 Mar 2020 15:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7lqrQDcbByO; Thu,  5 Mar 2020 15:39:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 79DC821519;
	Thu,  5 Mar 2020 15:39:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CA97C18DA;
	Thu,  5 Mar 2020 15:39:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D50A2C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 15:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B892E20372
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 15:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9U8Q3RSPMxS
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 15:39:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 80CF32002D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 15:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583422766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NqkJYnrX939afrvZWNAzIUgTdi1dF3s2yc9aSiDADMI=;
 b=PRSvraWuxX969ZEfzv/UrkXKmrwCFFHh7OkRdtAnNwpmw+6nRyxWKnuQgKOxuYsxTs7FH+
 iffA1EP7DY80c0HAJv7mv9i4TC4/FCTyxhqqaY3V3kh4qDUSezfinZfFKFSiKiW22sXsY3
 gUuO6w+yZYVWozkB1zDoqOmpFdR1VmQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-WNkQ52zZPvCOafMev4ViCg-1; Thu, 05 Mar 2020 10:39:24 -0500
X-MC-Unique: WNkQ52zZPvCOafMev4ViCg-1
Received: by mail-qt1-f200.google.com with SMTP id x21so1842555qtq.22
 for <virtualization@lists.linux-foundation.org>;
 Thu, 05 Mar 2020 07:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NqkJYnrX939afrvZWNAzIUgTdi1dF3s2yc9aSiDADMI=;
 b=d1m0MseVju7vikuAoo+dwcBR0zO5NBR/RHarMSM6diOkNjELJHGTJeybbwmn001WzG
 21MBFxcSAqDppziDw/puC2chln3rjEzNVOVFKYZPvICFp6EfmaFHWnU3VutPBfo/Qh2q
 sgPztJDdyqOyYVBTurDzdO6rso915MMHHpv7ewENjKfuUayj0cUOBNs0I59UG+q0+0fN
 CEq8S8IJEpRuFcjl3YFFWY4CM4e4dLIxh9Tecj6zi0OEjq4CpEc3fikwHr3HEfbSkKW3
 NYH2Wgj+SwqFJXzOYw9vXzse9X2FpP6buzuoW8nq20+QU852ay6Sat87MMPt5yaRO/yV
 O/qA==
X-Gm-Message-State: ANhLgQ0j237ADhZTAkpIMcloA76wBormRgsjp+pRKFah3rCRG7Kdacmk
 K8EN+zouP9A6kGX9kJ70ee5llgqJNmw8U8hDclZH4oxLv0hom7/Ne8L5aWdzzjt8OZUpNiIY4Ts
 KzWyPkZNxWckbiRoY7f+m32Xh/MhMg3xbKboi91Ggsg==
X-Received: by 2002:a37:ef04:: with SMTP id j4mr8605776qkk.68.1583422764391;
 Thu, 05 Mar 2020 07:39:24 -0800 (PST)
X-Google-Smtp-Source: ADFU+vugbQrzs1xvBMEx8t8NnE6JKtfBaXVhDcJzv5NXl0ZNLWtGWOLk269aWs3+9NVlpA5U/V3/0w==
X-Received: by 2002:a37:ef04:: with SMTP id j4mr8605755qkk.68.1583422764197;
 Thu, 05 Mar 2020 07:39:24 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id w4sm2509730qts.92.2020.03.05.07.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 07:39:22 -0800 (PST)
Date: Thu, 5 Mar 2020 10:39:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200305103759-mutt-send-email-mst@kernel.org>
References: <20200228172537.377327-2-jean-philippe@linaro.org>
 <20200302161611.GD7829@8bytes.org>
 <9004f814-2f7c-9024-3465-6f9661b97b7a@redhat.com>
 <20200303130155.GA13185@8bytes.org>
 <20200303084753-mutt-send-email-mst@kernel.org>
 <20200303155318.GA3954@8bytes.org>
 <20200303105523-mutt-send-email-mst@kernel.org>
 <20200304133707.GB4177@8bytes.org>
 <20200304142838-mutt-send-email-mst@kernel.org>
 <20200304215001.GD3315@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <20200304215001.GD3315@8bytes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-pci@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Auger Eric <eric.auger@redhat.com>,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 jacob.jun.pan@intel.com, bhelgaas@google.com, robin.murphy@arm.com
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

On Wed, Mar 04, 2020 at 10:50:02PM +0100, Joerg Roedel wrote:
> On Wed, Mar 04, 2020 at 02:34:33PM -0500, Michael S. Tsirkin wrote:
> > All these extra levels of indirection is one of the reasons
> > hypervisors such as kata try to avoid ACPI.
> 
> Platforms that don't use ACPI need another hardware detection mechanism,
> which can also be supported. But the first step here is to enable the
> general case, and for x86 platforms this means ACPI.
> 
> Regards,
> 
> 	Joerg

Frankly since a portable way to do it is needed anyway I don't see why
we also need ACPI.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
