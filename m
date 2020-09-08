Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9A626128E
	for <lists.virtualization@lfdr.de>; Tue,  8 Sep 2020 16:22:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A2B6872C3;
	Tue,  8 Sep 2020 14:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7n4IiEw0J5i9; Tue,  8 Sep 2020 14:22:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CF8C5872C7;
	Tue,  8 Sep 2020 14:22:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABD94C0051;
	Tue,  8 Sep 2020 14:22:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 151C0C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 14:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F39178722F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 14:22:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7SnZPUQltxCl
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 14:22:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5E4A987225
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 14:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599574921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cIq/H7MU4yjMR3Dxb1c5M85cjyHgWOfijzmJ6gh8S4M=;
 b=YTHGBUs5381FZvOlgViLzO6JiFs9lCxtln7Rx+No294lrKV0hYEabHUmM6eqVIHCY0krUw
 0fRnQ06SSw0WA71Env0ShvElDS7bfdHyOsRVQcFXV+pfQZ8sOvt2cbcoPntK5ZppXBI7n3
 7/cNWh7YFYogWGtrZ/0KMsiUgLNDhdY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-2A_FGk-cMxyYpyNJJ0wi6w-1; Tue, 08 Sep 2020 10:21:59 -0400
X-MC-Unique: 2A_FGk-cMxyYpyNJJ0wi6w-1
Received: by mail-ej1-f71.google.com with SMTP id rs9so3777506ejb.17
 for <virtualization@lists.linux-foundation.org>;
 Tue, 08 Sep 2020 07:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cIq/H7MU4yjMR3Dxb1c5M85cjyHgWOfijzmJ6gh8S4M=;
 b=GfJbavsisGbh7bluufLqFJM+yttcVPS9JUAQ0OBa1bI8BkBcoYOXr2QhqpbsD+fN8N
 iNxhVcvfyBYYuhVs6A+2QZ4sGCQzhYdsmdv6LfQhhVbPc2c8pN3uAn5cMbwtlz4PN8tR
 riX8XZljZe+WxoBQ+IA/pDQOep77LLBp5XGFpk26t7G5p+B91Hp5roWKAaRrYzOmGQVy
 k8opFh/dRbgP58WVF2ArrJ49hSiJ/DO/LzIYgE5ZLuaPpAFH9KM3fB06WNeSOuyqinIk
 Q1ev5pb2F65BNXGoLgPZGLj6F3gGbIfLc6GaRjhJlVwKwQRNsNCqj1OyBNrJqq9qncgQ
 GU5Q==
X-Gm-Message-State: AOAM532oivfi2At8Ryjw9EEte3lmy2qz+Iu40iWy9AhccGk8me7Dx0p9
 9JqIu2nhfWz+RS7J8EP/IxrdAGLWvSBh+bGRjlB/HhVZ0SXMFDFvbOCEQStN/HbrmeDLKYv0Gja
 t9daIgxfLT54VUagUoGJu+UE06HzPxnyPJ54xegBr1w==
X-Received: by 2002:a17:906:facb:: with SMTP id
 lu11mr27438262ejb.249.1599574918085; 
 Tue, 08 Sep 2020 07:21:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcrrxhjakvShyUktbSgcQRcpXgRjHqw8S3hbu9iZfrSPWQtWOzrRv0FR0qtNZ9apnBfLejsA==
X-Received: by 2002:a17:906:facb:: with SMTP id
 lu11mr27438244ejb.249.1599574917844; 
 Tue, 08 Sep 2020 07:21:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5f70:b94c:ca5f:28f2?
 ([2001:b07:6468:f312:5f70:b94c:ca5f:28f2])
 by smtp.gmail.com with ESMTPSA id i15sm10063285edf.82.2020.09.08.07.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 07:21:57 -0700 (PDT)
Subject: Re: [PATCH] Rescan the entire target on transport reset when LUN is 0
To: Matej Genci <matej.genci@nutanix.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CY4PR02MB33354370E0A81E75DD9DFE74FB520@CY4PR02MB3335.namprd02.prod.outlook.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <200ad446-1242-9555-96b6-4fa94ee27ec7@redhat.com>
Date: Tue, 8 Sep 2020 16:22:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CY4PR02MB33354370E0A81E75DD9DFE74FB520@CY4PR02MB3335.namprd02.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>
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

On 28/08/20 14:21, Matej Genci wrote:
> VirtIO 1.0 spec says
>     The removed and rescan events ... when sent for LUN 0, they MAY
>     apply to the entire target so the driver can ask the initiator
>     to rescan the target to detect this.
> 
> This change introduces the behaviour described above by scanning the
> entire scsi target when LUN is set to 0. This is both a functional and a
> performance fix. It aligns the driver with the spec and allows control
> planes to hotplug targets with large numbers of LUNs without having to
> request a RESCAN for each one of them.
> 
> Signed-off-by: Matej Genci <matej@nutanix.com>
> Suggested-by: Felipe Franciosi <felipe@nutanix.com>
> ---
>  drivers/scsi/virtio_scsi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
> index bfec84aacd90..a4b9bc7b4b4a 100644
> --- a/drivers/scsi/virtio_scsi.c
> +++ b/drivers/scsi/virtio_scsi.c
> @@ -284,7 +284,12 @@ static void virtscsi_handle_transport_reset(struct virtio_scsi *vscsi,
>  
>  	switch (virtio32_to_cpu(vscsi->vdev, event->reason)) {
>  	case VIRTIO_SCSI_EVT_RESET_RESCAN:
> -		scsi_add_device(shost, 0, target, lun);
> +		if (lun == 0) {
> +			scsi_scan_target(&shost->shost_gendev, 0, target,
> +					 SCAN_WILD_CARD, SCSI_SCAN_INITIAL);
> +		} else {
> +			scsi_add_device(shost, 0, target, lun);
> +		}
>  		break;
>  	case VIRTIO_SCSI_EVT_RESET_REMOVED:
>  		sdev = scsi_device_lookup(shost, 0, target, lun);
> 


Acked-by: Paolo Bonzini <pbonzini@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
