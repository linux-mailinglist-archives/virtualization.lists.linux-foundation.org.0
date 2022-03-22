Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D55384E3AC9
	for <lists.virtualization@lfdr.de>; Tue, 22 Mar 2022 09:39:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98FF040499;
	Tue, 22 Mar 2022 08:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x765dOvqml-V; Tue, 22 Mar 2022 08:38:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C895940386;
	Tue, 22 Mar 2022 08:38:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C68CC0082;
	Tue, 22 Mar 2022 08:38:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F19CEC000B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Mar 2022 08:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2242611C5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Mar 2022 08:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbp4gCG1KFYf
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Mar 2022 08:38:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8895A60AB9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Mar 2022 08:38:52 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id h16so9335597wmd.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Mar 2022 01:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=0FcdRambMsRKShOfd/k3JzjIzx8GGv4n7YmQbRU/7n0=;
 b=Y3xe2I+02e59CSj38zdXDui9CE/6ErgGJ++KwIUKwU358ObMwCJBrG2FQ+sZgBojXa
 gA5uvZYgdE9utRRoDrGgXf7odL1k9cEWRxpf0CkNhW+2zllcXtoFZgnKAJg31y3+Mau6
 9r4AV8BDlsaUe3oxOewaap5YDfCIT8LB43pPo4k0flxjlcSYGoJwEWgZNkBGgNKpcCS/
 YvDuZytJrJJOKrKDkFrkByOAgdwXKQW+d/1jaWpvEY4sRpXgPlANFOJVu30joUu+sVWV
 UXG/vbTv/RKDu4VYyEoR3DF+4p3zQqAtLZLA7UG5Qs81g7Pcdh4oyQNQYfo8gwdNNa37
 2l4w==
X-Gm-Message-State: AOAM532DPiJdyurW7xuAyNH/rq8lfgMDNW9plId17W5XQ4WnWlQXAhKJ
 KURAv+lb0th+XCsF5YsOfnw=
X-Google-Smtp-Source: ABdhPJx5cFoT4/ge0DuruG2LnSzEJ79ktilr8/JnWLY7QJDxE5kYgAMTZFcS3KNJQKTEJo5dvxbGKw==
X-Received: by 2002:a1c:2744:0:b0:382:a9b7:1c8a with SMTP id
 n65-20020a1c2744000000b00382a9b71c8amr2551228wmn.187.1647938330451; 
 Tue, 22 Mar 2022 01:38:50 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 i206-20020a1c3bd7000000b0038bfc3ab76csm1336485wma.48.2022.03.22.01.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 01:38:49 -0700 (PDT)
Message-ID: <7b6fec6a-12ef-7381-b06e-108a7b3ff1e4@kernel.org>
Date: Tue, 22 Mar 2022 09:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: virtio: mmio: add optional virtio,wakeup
 property
Content-Language: en-US
To: Minghao Xue <quic_mingxue@quicinc.com>
References: <1646733156-19333-1-git-send-email-quic_mingxue@quicinc.com>
 <20220317063515.GA30789@mingxue-gv.qualcomm.com> <YjMJ32SFXTLCuaRY@myrica>
 <20220318021052.GA16300@mingxue-gv.qualcomm.com>
 <d4d69acd-72d3-dfe1-9a11-d6590d2d90d8@kernel.org>
 <20220322061956.GA1441@mingxue-gv.qualcomm.com>
In-Reply-To: <20220322061956.GA1441@mingxue-gv.qualcomm.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, quic_ztu@quicinc.com
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

On 22/03/2022 07:19, Minghao Xue wrote:
> Hi Krzysztof,
> 
> Thanks for your comment. First of all, which "generic wakeup-source
> property" do you mean? 

There is only one generic - wakeup-source.

> Could you give an example? I find "wakeup-source"
> property in several binding files. Are you pointing to this? 

Yes, use wakeup-source.

Please avoid top-posting.



Best regards,
Krzysztof
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
