Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 226751BD8CB
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 11:52:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A7CC48695E;
	Wed, 29 Apr 2020 09:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMyT9LqjWROs; Wed, 29 Apr 2020 09:52:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 93FEC86933;
	Wed, 29 Apr 2020 09:52:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6217AC0172;
	Wed, 29 Apr 2020 09:52:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDB36C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 09:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BD41120406
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 09:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9JKrVZXMwken
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 09:52:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id F094E22E89
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588153932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7IZWphU6PtHquCqE0i6um38oK8paShAt54dfHnz8KmQ=;
 b=CsO97eGEro2k/1INTTfYCmqXYsEZCa94o+Uc9h222lwfBC2Qp9/eY2eRzR4EPG0SNO4Kh9
 oF/CCAbvdItLITpSscG5xrVmYYWhZTHVzcBp4YHreXkbBLDgqCaEh0AUpjgLwpsZnH++Tj
 pyoUGCesv002+pJ+R9jnE26+3AGKFqY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-cnD3riVoOUGgFF3pU6qKFQ-1; Wed, 29 Apr 2020 05:52:11 -0400
X-MC-Unique: cnD3riVoOUGgFF3pU6qKFQ-1
Received: by mail-wm1-f70.google.com with SMTP id h22so992103wml.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 02:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7IZWphU6PtHquCqE0i6um38oK8paShAt54dfHnz8KmQ=;
 b=PrjhSK1ga6vCyzB0Xd7TnEg7fdNgmFbkf8faFm7L2SPSmSv0b9VXmlFRZ+k2mxYq5b
 +ZDvHB9x3qqt0QQxSrmMJMr6vnwNhLyt26kXTJRkdFdGWhBdzetW1h9CoPGtInjPk5YI
 x4mcIJpFY/5Z1wM6eQhctjviBCsGSjXDUkVek6u4dSP89IM0t6kKhRmg6qTqz5Zgk7Z7
 KHK01UjSx/BjEsqN+4plA6JJE4w0+97kOxIDIZNvYpfpyweHDjDCDe1sbaajdmk3Y8U/
 AW5R6Bk+c3V+kRVTq5kJleZlJNwG0/oafJ/ZZnjP7tCdPZGq0aDwkvd20Z9NqwvaEtBN
 ORlw==
X-Gm-Message-State: AGi0PuYEjWsbLwThoYAydZISSxCuS7+XWVngpxcfBs8zR1EbkdHAsvnD
 qd0NJ9xEkt3i11UH8ZedMFwqLRn5XalgstGvzjKL19MDEfz5Rlt0+XnAdOTR5d5oTBns5pNQNjg
 Xyc2rv8i9urrjOUEo0O0f9BzhUo466wiw1+YWn9TTaw==
X-Received: by 2002:a5d:6851:: with SMTP id o17mr37134248wrw.267.1588153929730; 
 Wed, 29 Apr 2020 02:52:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypKRdM34lQ/3OGcwItQoxnplrvwZwErBKY2jH3AvTLAgP599BhH8xTgBBhPvAXTcnaVguo7aJg==
X-Received: by 2002:a5d:6851:: with SMTP id o17mr37134206wrw.267.1588153929489; 
 Wed, 29 Apr 2020 02:52:09 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 s24sm7232898wmj.28.2020.04.29.02.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 02:52:08 -0700 (PDT)
Date: Wed, 29 Apr 2020 05:52:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [PATCH 5/5] virtio: Add bounce DMA ops
Message-ID: <20200429055125-mutt-send-email-mst@kernel.org>
References: <1588073958-1793-1-git-send-email-vatsa@codeaurora.org>
 <1588073958-1793-6-git-send-email-vatsa@codeaurora.org>
 <20200428121232-mutt-send-email-mst@kernel.org>
 <20200428174952.GA5097@quicinc.com>
 <20200428163448-mutt-send-email-mst@kernel.org>
 <275eba4b-dd35-aa95-b2e3-9c5cbf7c6d71@linux.intel.com>
 <20200429004531-mutt-send-email-mst@kernel.org>
 <b676430c-65b3-096e-ca48-ceebf10f4b28@linux.intel.com>
 <20200429023842-mutt-send-email-mst@kernel.org>
 <20200429094410.GD5097@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20200429094410.GD5097@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org, will@kernel.org,
 konrad.wilk@oracle.com, jan.kiszka@siemens.com, christoffer.dall@arm.com,
 pratikp@codeaurora.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, stefano.stabellini@xilinx.com,
 linux-kernel@vger.kernel.org, Lu Baolu <baolu.lu@linux.intel.com>
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

On Wed, Apr 29, 2020 at 03:14:10PM +0530, Srivatsa Vaddagiri wrote:
> * Michael S. Tsirkin <mst@redhat.com> [2020-04-29 02:50:41]:
> 
> > So it seems that with modern Linux, all one needs
> > to do on x86 is mark the device as untrusted.
> > It's already possible to do this with ACPI and with OF - would that be
> > sufficient for achieving what this patchset is trying to do?
> 
> In my case, its not sufficient to just mark virtio device untrusted and thus
> activate the use of swiotlb. All of the secondary VM memory, including those
> allocate by swiotlb driver, is private to it.

So why not make the bounce buffer memory shared then?

> An additional piece of memory is
> available to secondary VM which is shared between VMs and which is where I need
> swiotlb driver to do its work.
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
