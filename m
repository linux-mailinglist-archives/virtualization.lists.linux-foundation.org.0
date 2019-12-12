Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B2211C14C
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 01:28:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F07F887E8C;
	Thu, 12 Dec 2019 00:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4gpPBdCzCaBu; Thu, 12 Dec 2019 00:28:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 64BAB87C1A;
	Thu, 12 Dec 2019 00:28:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C02BC0881;
	Thu, 12 Dec 2019 00:28:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BF0CC0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 00:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 673A323528
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 00:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szkb0hvjEr99
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 00:28:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id E964C23524
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 00:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576110493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hb5JBtjwXvbmme4Dxt6Sh1XFoFaw8S8TIapNfxubP9w=;
 b=ewgbKEQ5fLMgONL7JmY2NfQ9C9Nx+MlUiseSvD6hFTc/Iuxjsa/Y+Ucc9DkxZctvV+QJhA
 3+SHBfc4n9A0SvS30XOMEfX808wtywBqxI19k3BEDJ/HIiRoEFBfWbGFcopjCEp0EMJW+P
 Jdqp7RDrpyhen68B/Hl7nO7GBQ7iTaA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-sM9-IVuhP1-iXjSimaDxnQ-1; Wed, 11 Dec 2019 19:28:12 -0500
Received: by mail-wr1-f70.google.com with SMTP id i9so316487wru.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 16:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hb5JBtjwXvbmme4Dxt6Sh1XFoFaw8S8TIapNfxubP9w=;
 b=jRP3DJiHq6o3kosWKia8qk+7d5Hb7bRQEWHczuN8N0sIV1T+pFlpn1vkFIgssKP5Ca
 +W1T7vUHCf5wFnL4prKsasAcXVyy0O++U5k0ITt2FjVGSJ1EkiqABolVnwj6JX2AKUoo
 vioDkLHsrAV4QND4DP4LwYldECUdSppdolBv/9TC9CzeA+EZhGXKJ/fJz1xS78hFPkx5
 kdia63ECFEd5vGn5YVCLm3Zo3Jmmjbz3qWQwjZff8i5UNT+KywjiWmyzAY1UawNBLfh2
 Hcr7jDFRI4ZVMFrMEP7gX9UXMirLlkMQ3ipDfQrIL/NC/OmdXSvuD2++sw+qDW6jGEX/
 L0kw==
X-Gm-Message-State: APjAAAWhdWnUWu38SQHs6+gjY9YTy8g/QO8biUrAIG+JPBVlqEu347q6
 XnInyMKyTFyLAliwyNG3VsEczJ22+5b/ntnQaUToqgiFQTKHeKUb37HonE6dt6w4D9vnenssPt1
 FC2BFuck5rB5OZs8pv+6hQPEXxjp+mBECyh2yzZvQ2Q==
X-Received: by 2002:adf:8bde:: with SMTP id w30mr2790577wra.124.1576110490980; 
 Wed, 11 Dec 2019 16:28:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqwPP/UQtQvR7H0tI553soFfAslbKh86aszplkbovgcOGgnxj1GpFCjYyjEJLCUeQDAEqXIk1A==
X-Received: by 2002:adf:8bde:: with SMTP id w30mr2790552wra.124.1576110490746; 
 Wed, 11 Dec 2019 16:28:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id g9sm4134194wro.67.2019.12.11.16.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 16:28:10 -0800 (PST)
Subject: Re: [PATCH 15/24] compat_ioctl: scsi: move ioctl handling into drivers
To: "Michael S. Tsirkin" <mst@redhat.com>, Arnd Bergmann <arnd@arndb.de>
References: <20191211204306.1207817-1-arnd@arndb.de>
 <20191211204306.1207817-16-arnd@arndb.de>
 <20191211180155-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <858768fb-5f79-8259-eb6a-a26f18fb0e04@redhat.com>
Date: Thu, 12 Dec 2019 01:28:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191211180155-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-MC-Unique: sM9-IVuhP1-iXjSimaDxnQ-1
X-Mimecast-Spam-Score: 0
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>,
 Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, y2038@lists.linaro.org,
 Damien Le Moal <damien.lemoal@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Kai_M=c3=a4kisara?= <Kai.Makisara@kolumbus.fi>,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Doug Gilbert <dgilbert@interlog.com>,
 linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-scsi@vger.kernel.org
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

On 12/12/19 00:05, Michael S. Tsirkin wrote:
>> @@ -405,6 +405,9 @@ static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
>>  
>>  static const struct block_device_operations virtblk_fops = {
>>  	.ioctl  = virtblk_ioctl,
>> +#ifdef CONFIG_COMPAT
>> +	.compat_ioctl = blkdev_compat_ptr_ioctl,
>> +#endif
>>  	.owner  = THIS_MODULE,
>>  	.getgeo = virtblk_getgeo,
>>  };
> Hmm - is virtio blk lumped in with scsi things intentionally?

I think it's because the only ioctl for virtio-blk is SG_IO.  It makes
sense to lump it in with scsi, but I wouldn't mind getting rid of
CONFIG_VIRTIO_BLK_SCSI altogether.

Paolo

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
