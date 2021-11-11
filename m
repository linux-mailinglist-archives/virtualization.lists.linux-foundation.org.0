Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C597F44D321
	for <lists.virtualization@lfdr.de>; Thu, 11 Nov 2021 09:24:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CE7140404;
	Thu, 11 Nov 2021 08:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLqOjaI_t6B9; Thu, 11 Nov 2021 08:24:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BBB7B40389;
	Thu, 11 Nov 2021 08:24:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A066C0036;
	Thu, 11 Nov 2021 08:24:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D89AC001E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 08:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67B8C40342
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 08:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DXCE1EwImYep
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 08:24:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2E09402A5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 08:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636619044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eTvK+mccx+UjyRl1JmGIPMoCfbXNcpJJ4KW+6cng93Q=;
 b=MuevK41LkE9gqoj49bbqtbU2Td1EE1nbd3W+mzzMxx/OL0SBG5KzQFW87aKSiIzgtupFWo
 0Zbgq85o4f/m076TGDNI/EcFarUu7iNk/uHsb/zMuq23PBlF+Ur66ao8n+6fo+Ckmc9GQL
 jJLLncYLzpVVXPhkvAwsQts94To5glo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189--w8CrKvJOOS2ZhZwz5vtZg-1; Thu, 11 Nov 2021 03:24:03 -0500
X-MC-Unique: -w8CrKvJOOS2ZhZwz5vtZg-1
Received: by mail-ed1-f69.google.com with SMTP id
 h18-20020a056402281200b003e2e9ea00edso4727908ede.16
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 00:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eTvK+mccx+UjyRl1JmGIPMoCfbXNcpJJ4KW+6cng93Q=;
 b=vzzxveRxfrAppFhUf4lPfKp/qkkM3yw94UJU7+QAgBe9VNcwXNBS9btCzob7MOZQMU
 cdezB3B9MNqgycgQsuv/YYCS9dweRbiQueq26gIlb1N86Wh05FXkObZoHU+q5LlmLzaS
 EogR6rpp+5yxmX0WVq7twsDB7x3ObiNH8DLFDCpR8cDBpytpwR2P0ZpQaBcqxqF3yB9y
 0tsTuOEDzfxHLz2EltwrhLEiKZa8DxJE2AX8jCOIPNbPy3RJAACp3C9NS8hxuNm8VtFJ
 HPtoLUdITzKxOPGtLibbFw1IIJ6en08SeIaixySL/2MotOKYpDMBze+VzgfaLSNRvrJP
 8M/g==
X-Gm-Message-State: AOAM53305dx4hkHrauWEcIXOsKqtnlvsAk4MgHTaDZTsneqmgmsDzwR0
 puJuAHVkhnGjW/SXurOaTJ9lPoOkF4JkJPcl0azgFpoh987Md2MmlmI/RbwZxvcWrUlgs3p8fvk
 ezd8KDCR0wJYXloM7R0nF3oq2jUwseEqq/edvsZLbgw==
X-Received: by 2002:a05:6402:28d:: with SMTP id
 l13mr7672895edv.74.1636619042093; 
 Thu, 11 Nov 2021 00:24:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxh7NgnQKeWuePv51kZSn8tyMvV9om4wE15juGxL0CTJycLN+t5HM5JPD2xUZKatGFu6H1MkA==
X-Received: by 2002:a05:6402:28d:: with SMTP id
 l13mr7672859edv.74.1636619041867; 
 Thu, 11 Nov 2021 00:24:01 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id go17sm920469ejc.76.2021.11.11.00.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 00:24:01 -0800 (PST)
Message-ID: <c759c222-34a5-7ee6-933a-457bb98bab81@redhat.com>
Date: Thu, 11 Nov 2021 09:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC] hypercall-vsock: add a new vsock transport
To: "Wang, Wei W" <wei.w.wang@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <71d7b0463629471e9d4887d7fcef1d8d@intel.com>
 <20211110111718.5cvt6vgory3fzqld@steredhat>
 <9901a74b149d4245b0e6c998b5cde7af@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <9901a74b149d4245b0e6c998b5cde7af@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: "Yamahata, Isaku" <isaku.yamahata@intel.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Kleen, Andi" <andi.kleen@intel.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 Andra Paraschiv <andraprs@amazon.com>
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 11/11/21 09:14, Wang, Wei W wrote:
>> Adding Andra and Sergio, because IIRC Firecracker and libkrun 
>> emulates virtio-vsock with virtio-mmio so the implementation
>> should be simple and also not directly tied to a specific VMM.
>> 
> OK. This would be OK for KVM based guests. For Hyperv and VMWare 
> based guests, they don't have virtio-mmio support. If the MigTD (a 
> special guest) we provide is based on virtio-mmio, it would not be 
> usable to them.

Hyper-V and VMware (and KVM) would have to add support for
hypercall-vsock anyway.  Why can't they just implement a subset of
virtio-mmio?  It's not hard and there's even plenty of permissively-
licensed code in the various VMMs for the *BSDs.

In fact, instead of defining your own transport for vsock, my first idea
would have been the opposite: reuse virtio-mmio for the registers and
the virtqueue format, and define your own virtio device for the MigTD!

Thanks,

Paolo

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
