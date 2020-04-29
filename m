Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 927AB1BD96E
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 12:21:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C42ED8775B;
	Wed, 29 Apr 2020 10:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KlZK-sgYqnxn; Wed, 29 Apr 2020 10:20:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5154E87750;
	Wed, 29 Apr 2020 10:20:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A918C0172;
	Wed, 29 Apr 2020 10:20:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5DB2C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 10:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C17D02042A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 10:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wAqD87cqtoIA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 10:20:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id D3FA52041C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588155654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HvmAgJ1OCqs5BSQtwGJP89ITCctRl3ojWHctS5awxpw=;
 b=P528IEdk04/iYzcxSpJ6P0bg7t6A7Cn9+AteIY9oM5lvXt995bMNkSW8eN52WA41UGn1uF
 g/8QtoWNNpKMojw1E5mjSm8t2hbmJwvRcH1GeT8oOGdl4XnRYczEJmO0/oeQn3yVP+tXLy
 PPhpgqVBMN8ASVcwA0hVrWcZ6+wV8BE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-eejuMjoHOM-EjPOuRNJA-w-1; Wed, 29 Apr 2020 06:20:53 -0400
X-MC-Unique: eejuMjoHOM-EjPOuRNJA-w-1
Received: by mail-wm1-f71.google.com with SMTP id t62so1020378wma.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 03:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HvmAgJ1OCqs5BSQtwGJP89ITCctRl3ojWHctS5awxpw=;
 b=CTlVfL1krblUJd6RJblB1G7UD2FBJsWJS59WccwssoZkGpusIGo0njbxr+qX1Fdo/J
 yUYNWmhEXvVXgndlWpLe0/FMpM7fid0FhgefiNYf2tcR0UEOSa0r6tzS/IDSu1hqk4ZU
 ZFnLyu6pk7/8LZ5pUB9v0EeIlp3lNnOlXk0RA3nmIUmjmB9oh/CUs5Shc8MTIG5/UUK3
 veV0wkhtZIlD4rvswA4G16En8My1LwvVT/nOvp7ixO2YDlz98QBWLgRcj6SbX7jsLM4d
 OzPuUYOCUAQxVCe4htUNBH69ELFps9ih9AVS8LY59NumYjVKtD6m1bsd9MJoFVRmwQhv
 QEnQ==
X-Gm-Message-State: AGi0PuaHNhEzIpQhjPmku2oiYb+sw2KRi5wMck7GxlCfLOcHcOF/aWbZ
 a9sA1vW0rFO1L8zEezIUIWMkJgnAovJdCrrOFqWuUJJKu9nvkefD6scFiZ5bIsA2RM61X2LkEqK
 UkNlu1WFCjZyBhY+vCCeATH89/WONttte//vh0tmCgQ==
X-Received: by 2002:adf:f748:: with SMTP id z8mr36689655wrp.45.1588155651891; 
 Wed, 29 Apr 2020 03:20:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypL7W87TuCEBCh4Hv8OBMcyMuv2V+tdXaHVIwWppnAllxcN7DLIJZP5w+iV7A/NbopWJbzldOA==
X-Received: by 2002:adf:f748:: with SMTP id z8mr36689638wrp.45.1588155651690; 
 Wed, 29 Apr 2020 03:20:51 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 t67sm7743622wmg.40.2020.04.29.03.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 03:20:50 -0700 (PDT)
Date: Wed, 29 Apr 2020 06:20:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [PATCH 5/5] virtio: Add bounce DMA ops
Message-ID: <20200429061621-mutt-send-email-mst@kernel.org>
References: <20200428121232-mutt-send-email-mst@kernel.org>
 <20200428174952.GA5097@quicinc.com>
 <20200428163448-mutt-send-email-mst@kernel.org>
 <275eba4b-dd35-aa95-b2e3-9c5cbf7c6d71@linux.intel.com>
 <20200429004531-mutt-send-email-mst@kernel.org>
 <b676430c-65b3-096e-ca48-ceebf10f4b28@linux.intel.com>
 <20200429023842-mutt-send-email-mst@kernel.org>
 <20200429094410.GD5097@quicinc.com>
 <20200429055125-mutt-send-email-mst@kernel.org>
 <20200429100953.GE5097@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20200429100953.GE5097@quicinc.com>
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

On Wed, Apr 29, 2020 at 03:39:53PM +0530, Srivatsa Vaddagiri wrote:
> That would still not work I think where swiotlb is used for pass-thr devices
> (when private memory is fine) as well as virtio devices (when shared memory is
> required).

So that is a separate question. When there are multiple untrusted
devices, at the moment it looks like a single bounce buffer is used.

Which to me seems like a security problem, I think we should protect
untrusted devices from each other.





> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
