Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9917C43AA72
	for <lists.virtualization@lfdr.de>; Tue, 26 Oct 2021 04:45:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50CE8608AC;
	Tue, 26 Oct 2021 02:45:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKS36IvFQTEf; Tue, 26 Oct 2021 02:45:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3169C608AB;
	Tue, 26 Oct 2021 02:45:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8C39C000E;
	Tue, 26 Oct 2021 02:45:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5543CC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 02:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4424260894
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 02:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hT8pDg2D0a8V
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 02:45:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DD3760846
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 02:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635216340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2vePi3t5J6b6tEeEJeDQneZHzJtbBCqkAcc0E+Nb6A=;
 b=gN4Psds/dwlOlAz9FWdK4/usXE8Db/EGtvOuQNxkG1MrpCb9GgVFpXNEtVnMlype6NxXBD
 DYGS6EJwuxJWIiPWboN9i1Jj7pRKmFLuGG0kVtOnXjBrmV76Y9PJGi98Jk9FNZwwoflpOt
 MaNydqPqKGforGvqeoyPf2OVSZyyJAE=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-n_XBiZZxMRi8XIk_2xGIWg-1; Mon, 25 Oct 2021 22:45:38 -0400
X-MC-Unique: n_XBiZZxMRi8XIk_2xGIWg-1
Received: by mail-pf1-f197.google.com with SMTP id
 y124-20020a623282000000b0047a09271e49so7273103pfy.16
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Oct 2021 19:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=x2vePi3t5J6b6tEeEJeDQneZHzJtbBCqkAcc0E+Nb6A=;
 b=U4Y7w6/tB0hul/io3f/QtQPLY9PN/gYaARmXVETJilWjRTCvQCeDSYBctlm4QMhP0V
 FwyO1EF/NH2LyHq2zZUPSgZDNxXuZtC8y407Jz7CumDD0l23b3kwTbCPE8BYZlnvmlv5
 voImDtK9l2CvPwSw8goqPY0gjUqHvl+tQVsQyCets/7Yp/avlx7p3Q6b/fXigQ3NYRcq
 Wit5ndwuUWhCMbZo4TF8JpPj1QaB8lXkPUcPHlUigGRmsDZ6O3lrDqAtxi14ch3VjkRh
 dIzJpyZLYpe9Fe4bXyiqgu6RPRytgcVq8jgliwWCpViDDB1FgG0yGLJDDTIMnOnQX7Ww
 VZWg==
X-Gm-Message-State: AOAM53094kKrcCbeMpkO9cP5tSCViDtAYtVDuNsV2edpm3MxYf0jp4TK
 6ipL2TGEVrq0YXVKv2aNFvbYiHza4g12gfe0HqWf6HBe+acNZNujRZ/7Cq7edRe8u114p4bAGtB
 oVkS6sHkJeGzOzAxez4K5/LW3AeDosu+fT5BlCxlbPw==
X-Received: by 2002:a17:902:868c:b0:140:f6f:8a10 with SMTP id
 g12-20020a170902868c00b001400f6f8a10mr19797201plo.77.1635216337700; 
 Mon, 25 Oct 2021 19:45:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPpQXBzLiQj+Yp3fguS4RcOaQ6BildyYisUWU5XIwgehISuQT3lm+Sc8cHrldQVLrGWkjhew==
X-Received: by 2002:a17:902:868c:b0:140:f6f:8a10 with SMTP id
 g12-20020a170902868c00b001400f6f8a10mr19797180plo.77.1635216337424; 
 Mon, 25 Oct 2021 19:45:37 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f22sm2582650pgk.21.2021.10.25.19.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 19:45:37 -0700 (PDT)
Subject: Re: [PATCH linux-next v4 2/8] vdpa: Introduce query of device config
 layout
To: Parav Pandit <parav@nvidia.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
References: <20211021163509.6978-1-parav@nvidia.com>
 <20211021163509.6978-3-parav@nvidia.com>
 <05bf6f39-66fc-cd9a-83d7-0836caf53239@redhat.com>
 <PH0PR12MB5481196C8E3509E55709C91FDC839@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <66a3e21d-4531-bb2d-e97f-3f677fc24b0d@redhat.com>
Date: Tue, 26 Oct 2021 10:45:33 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481196C8E3509E55709C91FDC839@PH0PR12MB5481.namprd12.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Eli Cohen <elic@nvidia.com>, "mst@redhat.com" <mst@redhat.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="iso-2022-jp"; Format="flowed"; DelSp="yes"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


$B:_(B 2021/10/25 $B2<8a(B2:59, Parav Pandit $B<LF;(B:
>
>> From: Jason Wang <jasowang@redhat.com>
>> Sent: Monday, October 25, 2021 11:36 AM
>>
>>
>> $B:_(B 2021/10/22 $B>e8a(B12:35, Parav Pandit $B<LF;(B:
>>> Introduce a command to query a device config layout.
>>>
>>> An example query of network vdpa device:
>>>
>>> $ vdpa dev add name bar mgmtdev vdpasim_net
>>>
>>> $ vdpa dev config show
>>> bar: mac 00:35:09:19:48:05 link up link_announce false mtu 1500
>>
>> Nit: it looks to me this patch doesn't expose link_announce but
>> max_virtqueue_pairs.
> It does expose the net status field that contains the link_announce.
> I missed to update the example for including max_vq_pairs.


Right.

Thanks


>> Other looks good.
>>
>> Thanks

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
