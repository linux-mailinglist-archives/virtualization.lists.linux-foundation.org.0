Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8451D17781B
	for <lists.virtualization@lfdr.de>; Tue,  3 Mar 2020 15:02:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2BCA5204FC;
	Tue,  3 Mar 2020 14:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2GiF-mHNPsg; Tue,  3 Mar 2020 14:02:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8C9F3204FB;
	Tue,  3 Mar 2020 14:02:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32552C013E;
	Tue,  3 Mar 2020 14:02:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3B60C013E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 14:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BAA5E858A6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 14:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aN4HODIizMEL
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 14:02:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1A44D858BA
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 14:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583244154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vURXmaMa/jNw8/wDeynB3tRJrpHBF8mvDGbk4U2gsFk=;
 b=C1INq8GUoIYUXXycWyMqGzUVDf06rhqfYoqlGBt6Y8WGXvbuu7yAZVJ2zGpFI78YnQL1Js
 jNsFqHzqBvN2bjA3cDd5KreAnDioMB9ikmBpXzZONIontilHQUGepmrZz+YHdJMVX0leRS
 Mcedh4R4FtR2XalS1BIGlzqgKIiOn70=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-3ENDRVwGMWGYV7Dc-ZiZ7g-1; Tue, 03 Mar 2020 09:02:30 -0500
X-MC-Unique: 3ENDRVwGMWGYV7Dc-ZiZ7g-1
Received: by mail-qt1-f199.google.com with SMTP id r19so2233827qtb.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Mar 2020 06:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vURXmaMa/jNw8/wDeynB3tRJrpHBF8mvDGbk4U2gsFk=;
 b=KdubNJUWKOni+bSyMRSzZgZEx0YoQmFLGJLYoExBqHyEt4Z3VnQa5Q82tJYIFecFyf
 +v1LoEZ+F2NVid8xrbJ3hJa3Y+k3YegJEt8GNpraEmP84PTj5hCSD7oxmi9SsLuaBbwB
 bp3SuOHRp1pLGjAQVuy6hMi8e0WGg5eOLp74E1hU/mxw8JC43v39z7PpQ4PM31aiOuQ6
 9b+HYZXVGtufVM1EMyr0X/RQxYvvRHNHODosTLwDOY+kaBvDoW4J5BELIoDRJeDV6HGh
 FEPqnXOaBlclw39c5kIA4apLLqNNvlNdklJGsGdpH3z7yVmWUe/H637ZmRM/d8SxkUkn
 JbPg==
X-Gm-Message-State: ANhLgQ3f7/31aZczjEl7/SMnyzqaY6xBYKVMRgFwjX4GU/Aj5X9iyyau
 KuIBryjpm0My9fLGQk/eun+iroL5AxUX267qyBboLIJ4uWmUn8KN8aR/GmPoHUTbraiFJuQXrPi
 5jLwgxKAUoml+omXt65pGlQNqAa9m39OSaGNs3YbHGQ==
X-Received: by 2002:ac8:8d6:: with SMTP id y22mr4331363qth.85.1583244149958;
 Tue, 03 Mar 2020 06:02:29 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsrHkcUNU/JWr3iaSlnrdpMaoXDL9dgR2gjUhWQ2iO+BPmktHURohbRSLr525HkXxY5rlNBXQ==
X-Received: by 2002:ac8:8d6:: with SMTP id y22mr4331328qth.85.1583244149723;
 Tue, 03 Mar 2020 06:02:29 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id j7sm8343441qti.14.2020.03.03.06.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 06:02:28 -0800 (PST)
Date: Tue, 3 Mar 2020 09:02:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200303090046-mutt-send-email-mst@kernel.org>
References: <20200228172537.377327-1-jean-philippe@linaro.org>
 <20200228172537.377327-2-jean-philippe@linaro.org>
 <20200302161611.GD7829@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <20200302161611.GD7829@8bytes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-pci@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eric.auger@redhat.com,
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

On Mon, Mar 02, 2020 at 05:16:12PM +0100, Joerg Roedel wrote:
> On Fri, Feb 28, 2020 at 06:25:36PM +0100, Jean-Philippe Brucker wrote:
> > This solution isn't elegant nor foolproof, but is the best we can do at
> > the moment and works with existing virtio-iommu implementations. It also
> > enables an IOMMU for lightweight hypervisors that do not rely on
> > firmware methods for booting.
> 
> I appreciate the enablement on x86, but putting the conmfiguration into
> mmio-space isn't really something I want to see upstream.

It's in virtio config space, not in mmio-space. With a PCI virtio-IOMMU
device this will be in memory.

> What is the
> problem with defining an ACPI table instead? This would also make things
> work on AARCH64 UEFI machines.
> 
> Regards,
> 
> 	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
