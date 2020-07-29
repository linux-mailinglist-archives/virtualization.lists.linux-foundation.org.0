Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EAC23275D
	for <lists.virtualization@lfdr.de>; Thu, 30 Jul 2020 00:10:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F32E787750;
	Wed, 29 Jul 2020 22:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EffFDwdvONZ4; Wed, 29 Jul 2020 22:10:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D6EAE876D5;
	Wed, 29 Jul 2020 22:10:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B72E4C004F;
	Wed, 29 Jul 2020 22:10:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E632FC004D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 22:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D3F1B86A61
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 22:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GwTe6Uzz7jCr
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 22:10:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 23E6886A5C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 22:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596060623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJ9gcg8hgg+gXoaDiJiCDnUPl9TBTNe9dHQAX/u98cA=;
 b=Fech8Rcu5VT5stjdknGY7iXYOKckOYJf+TJewSNyb0S4W+BFnorzrldNaJF3pr0XchhvQS
 bNdZMM+7VJ2clGWwvSAqZSy2yRt6qEWvwnM8o+470rGEy/8CgxoxCAzM+U7u7nWiXj7biQ
 QyR5vgsXFMT3rHk5iCQDqi40tQ5gC1A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-A0C3N5VxNi-IwPkmAIrrMw-1; Wed, 29 Jul 2020 18:10:21 -0400
X-MC-Unique: A0C3N5VxNi-IwPkmAIrrMw-1
Received: by mail-wr1-f70.google.com with SMTP id f7so7107797wrs.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 15:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bJ9gcg8hgg+gXoaDiJiCDnUPl9TBTNe9dHQAX/u98cA=;
 b=tIC7LPeYmv2rB+LkVMOuahzN2AfBE4lY53s5BLyfwR2IFOxpwJOFRkjYtBVVBkOkf+
 CQ80k3nHyEMY4Dak42y0od+YG5qq0pYJNkQpUfsPst8ph7AsbxlGMMSME6J1Aejq55qs
 Ggec8/9id/LVDOWKSdCLuXFLh0A6Tanuq0DItaN2Qy3tmEryz/+Jt2CH1RcHqvnd7nWc
 aPr4fomUXMNSOmV15N275aeYE9mhECcvJK7dDmfcSXVyayW45fOz/zS0E3kQt5J4/mFS
 xB6L8vBOF/Dth9OROtya48mDGHG1oFhTFGcgHzXFyGgv8jpBp9p3frdBAbqtMz5Se/Me
 UvAw==
X-Gm-Message-State: AOAM530rt6xQp534PmqZVytkpdcdMhxShnG2l7wXUBrw22w8pglY8hGL
 x7jzPKmjb+uh6kdTPKSaLGxq9xwqz7/gxWwMEYGPz0CRwNb/ljFtRG73seTr+bMv34s5q3wObVR
 71SXHmTSylcxAxrjOp8cPYoRXUIh16qrb1KvWmpEjRQ==
X-Received: by 2002:adf:de09:: with SMTP id b9mr18976057wrm.409.1596060620640; 
 Wed, 29 Jul 2020 15:10:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAVkmT45/6AHu0ZMgIzc+okxTAhaZCPNqOlK4XLAY29yq9rtl6Quhri6cx4tDK9mKXNiWkKA==
X-Received: by 2002:adf:de09:: with SMTP id b9mr18976036wrm.409.1596060620367; 
 Wed, 29 Jul 2020 15:10:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:101f:6e7:e073:454c?
 ([2001:b07:6468:f312:101f:6e7:e073:454c])
 by smtp.gmail.com with ESMTPSA id z8sm6490516wmf.42.2020.07.29.15.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 15:10:19 -0700 (PDT)
Subject: Re: [PATCH 1/1] scsi: virtio-scsi: handle correctly case when all
 LUNs were unplugged
To: Maxim Levitsky <mlevitsk@redhat.com>, linux-kernel@vger.kernel.org
References: <20200729194806.4933-1-mlevitsk@redhat.com>
 <20200729194806.4933-2-mlevitsk@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e56b2e4c-6dcd-1ec5-dde6-ef81c1f98e2a@redhat.com>
Date: Thu, 30 Jul 2020 00:10:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200729194806.4933-2-mlevitsk@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "open list:VIRTIO BLOCK AND SCSI DRIVERS"
 <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

On 29/07/20 21:48, Maxim Levitsky wrote:
> Commit 5ff843721467 ("scsi: virtio_scsi: unplug LUNs when events missed"),
> almost fixed the case of mass unpluging of LUNs, but it missed a
> corner case in which all the LUNs are unplugged at the same time.
> 
> In this case INQUIRY ends with DID_BAD_TARGET.
> Detect this and unplug the LUN.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  drivers/scsi/virtio_scsi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
> index 0e0910c5b9424..c7f0c22b6f11d 100644
> --- a/drivers/scsi/virtio_scsi.c
> +++ b/drivers/scsi/virtio_scsi.c
> @@ -351,6 +351,16 @@ static void virtscsi_rescan_hotunplug(struct virtio_scsi *vscsi)
>  			/* PQ indicates the LUN is not attached */
>  			scsi_remove_device(sdev);
>  		}
> +
> +		else if (host_byte(result) == DID_BAD_TARGET) {
> +			/*
> +			 * if all LUNs of a virtio-scsi device are unplugged,
> +			 * it will respond with BAD TARGET on any INQUIRY
> +			 * command.
> +			 * Remove the device in this case as well
> +			 */
> +			scsi_remove_device(sdev);
> +		}
>  	}
>  
>  	kfree(inq_result);
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
