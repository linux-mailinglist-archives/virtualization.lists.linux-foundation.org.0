Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3044221A5C0
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 19:26:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2134C2C9A6;
	Thu,  9 Jul 2020 17:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bswPeAujLx5K; Thu,  9 Jul 2020 17:25:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0B2E52C87E;
	Thu,  9 Jul 2020 17:25:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7E08C016F;
	Thu,  9 Jul 2020 17:25:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA02BC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 17:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9A28F2C87E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 17:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NBNBEsRRE-Fb
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 17:25:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id C41E02A349
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594315554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ayL2zRv44zVA/vI/qKLO5dT3uiTyNFjJ4KJMkaO+qQI=;
 b=IaujYDxF2W6Jwutx4k8RSXuG3gxU0gWQQcBBSdROO0kUfh6DCtrdPRx42lqqSo4RMsQ035
 gCiL0R34fXNFOrisq+YzUzomRlTjwwS9B5o/0oYDlw3/ZArOgmtp9N3ULOkicZu5g0GBw0
 QMfqp4t7ky0/Egy8Z4lMOBC3zNH304o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113--3AttSu9M0qCm5majvASOA-1; Thu, 09 Jul 2020 13:25:50 -0400
X-MC-Unique: -3AttSu9M0qCm5majvASOA-1
Received: by mail-wm1-f70.google.com with SMTP id 65so2834417wmd.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Jul 2020 10:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ayL2zRv44zVA/vI/qKLO5dT3uiTyNFjJ4KJMkaO+qQI=;
 b=VXTBoUmfyBWpGm2QfqrOHvTrTNBQX+yugx3wTjH/GrqPGdDZJOskBULnqpJRx5ayHt
 dHSpt8wrg5mAXCCS4nSxXxVgMk8dtiLRHpGhK+cIfiEHwwtTwVx2vMwR1s3+dLJidLtr
 ySNxwbhyJY/eFSKKGoiFTF7/oRBShOJVaQbElu5wDcN/hk9nNWqq4Vv2bw2D25Wmmjhj
 iPh/RjVV+Jol2PbqI4XiFWxmuaau9/7jcROoHWRKAaw9YOf6tGX4NFBoEHvscwEHx/RL
 qJ79x3J1fUhK79WXDWQa1aGatguY+02h/xq49A73lgMmEMwgd6ntB3m8ljSPyvzVV6YB
 4mEQ==
X-Gm-Message-State: AOAM531Hxg0gSLoOUj0YM0cwHK7RVEhEMrABaBJP6QztXKXMngoNDJ9J
 fKSWqh43ob+xmPAeMMOBc7fKWUn3c+ppzdRabWeAntixyHlrhVGZCJPAuKStcHw/P9/VUrlYeyN
 uucTf3oaMBb1xNTcCCa6lEpweKVpjjuknD/smPvnqjA==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr1009958wmc.109.1594315549633; 
 Thu, 09 Jul 2020 10:25:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2sedbzLwqgP/3k7XdcalLS7M8QME+eSe2xcF5rOIoSPUGVWnnJi2vGFbzZPqABCs7ueR2IQ==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr1009940wmc.109.1594315549388; 
 Thu, 09 Jul 2020 10:25:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c?
 ([2001:b07:6468:f312:9541:9439:cb0f:89c])
 by smtp.gmail.com with ESMTPSA id c15sm5608087wme.23.2020.07.09.10.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 10:25:48 -0700 (PDT)
Subject: Re: [PATCH] scsi: virtio_scsi: Remove unnecessary condition checks
To: Markus Elfring <Markus.Elfring@web.de>,
 Xianting Tian <xianting_tian@126.com>, linux-scsi@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <a197f532-7020-0d8e-21bf-42bb66e8daec@web.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e87746e6-813e-7c0e-e21e-5921e759da5d@redhat.com>
Date: Thu, 9 Jul 2020 19:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <a197f532-7020-0d8e-21bf-42bb66e8daec@web.de>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "James E. J. Bottomley" <jejb@linux.ibm.com>
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

On 09/07/20 19:16, Markus Elfring wrote:
>> +	mempool_destroy(virtscsi_cmd_pool);
>> +	virtscsi_cmd_pool = NULL;
>> +	kmem_cache_destroy(virtscsi_cmd_cache);
>> +	virtscsi_cmd_cache = NULL;
>>  	return ret;
>>  }
> 
> How do you think about to add a jump target so that the execution
> of a few statements can be avoided according to a previous
> null pointer check?

The point of the patch is precisely to simplify the code, executing a
couple more instruction is not an issue.

Paolo

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
