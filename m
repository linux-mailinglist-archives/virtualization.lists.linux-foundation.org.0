Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B5F6DCFF6
	for <lists.virtualization@lfdr.de>; Tue, 11 Apr 2023 05:10:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A801161411;
	Tue, 11 Apr 2023 03:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A801161411
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GI7EhJBN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMLnyDZm3Rc0; Tue, 11 Apr 2023 03:10:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 74D6A6140D;
	Tue, 11 Apr 2023 03:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74D6A6140D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26420C008C;
	Tue, 11 Apr 2023 03:10:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D824C002A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 03:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 503D86140D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 03:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 503D86140D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W9PAvMkrcI2N
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 03:10:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6E2060B0E
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6E2060B0E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 03:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681182604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PIRYPPRzMr0WDaISNXv8JTRc994C6mm8nrgRnA2e2II=;
 b=GI7EhJBNMJWAq94NMia1h0UTWBf5p+Phwijag7Xg419xeaCIF1+wjdOjxeE8QZLkIiW0DU
 jvmvg2EhG4nKv2hyiGYdYrO2IYhqxReleXfobsmX8rkuYZiqaWkWdTwij6EL9qqwQS9HWN
 fLTRSh6frxS4262r51hYw0QDUXOn/v0=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-5GYL5BlgMEWsIDKkXHzwWQ-1; Mon, 10 Apr 2023 23:09:58 -0400
X-MC-Unique: 5GYL5BlgMEWsIDKkXHzwWQ-1
Received: by mail-oo1-f72.google.com with SMTP id
 q186-20020a4a33c3000000b0053b61757527so2168959ooq.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Apr 2023 20:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681182597; x=1683774597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PIRYPPRzMr0WDaISNXv8JTRc994C6mm8nrgRnA2e2II=;
 b=oAsJYPWED1M/YztOJw0QND5MBFnFvDKNMay+z2TXED9D5WbbQsBIuzNcBAieSPiEPb
 f+pu1RgxJZs/0MIvxUaqn+ldskvYNWLu1Op5bzQaKdjZMttv6bEYNkaVKCRX5FHpaHZO
 9/onRH9NT5meG+VcYMPrHos4sSltqKNsbfNn2SRuqCBv0hbfbSO33+1zZ36vEnk7G2lE
 GW8IHcymW48zJ66EiTzltnYWhifcp8mQ9wVEunjMo15YejSqJ2LKMUeNEToETeC8VhlW
 eeRwrm++Lj/IZwnwdyktcHqPLZuzyopymZ20e5RvHKPPHb/1XVxwZ06rax1ZHNnCEX4l
 jCYQ==
X-Gm-Message-State: AAQBX9eASRUJF5THlUO+k6uWDC5G6fs4+pUPNvki5GA4T3zQFgPJujR5
 nxn0W0WT1JU5X/TDVVFyh9dstLN2tZrXOPO5IyC2/TurqjUFhWraSG7Fob30rpEnmFwk0NxQPuK
 RVA7CZL+eEe7Y0rhEOLgmFogTlysD/04fuLAvmoeOShBY/jlDdS6dOw+aMQ==
X-Received: by 2002:a54:4108:0:b0:389:86c3:b1fb with SMTP id
 l8-20020a544108000000b0038986c3b1fbmr1767289oic.9.1681182597578; 
 Mon, 10 Apr 2023 20:09:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZeucJf+EbWtNuhPzUoVMqvWrsCF6D+3DIu6eOe4RcryYcADiNhudEFaSmmkr0WQmH0aZjfEc0FYx82LleldDo=
X-Received: by 2002:a54:4108:0:b0:389:86c3:b1fb with SMTP id
 l8-20020a544108000000b0038986c3b1fbmr1767284oic.9.1681182597366; Mon, 10 Apr
 2023 20:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230410150130.837691-1-lulu@redhat.com>
In-Reply-To: <20230410150130.837691-1-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 11 Apr 2023 11:09:46 +0800
Message-ID: <CACGkMEvTdgvqacFmMJZD4u++YJwESgSmLF6CMdAJBBqkxpZKgg@mail.gmail.com>
Subject: Re: [PATCH] vhost_vdpa: fix unmap process in no-batch mode
To: Cindy Lu <lulu@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, mst@redhat.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gTW9uLCBBcHIgMTAsIDIwMjMgYXQgMTE6MDHigK9QTSBDaW5keSBMdSA8bHVsdUByZWRoYXQu
Y29tPiB3cm90ZToKPgo+IFdoaWxlIHVzaW5nIHRoZSBuby1iYXRjaCBtb2RlLCB0aGUgcHJvY2Vz
cyB3aWxsIG5vdCBiZWdpbiB3aXRoCj4gVkhPU1RfSU9UTEJfQkFUQ0hfQkVHSU4sIHNvIHdlIG5l
ZWQgdG8gYWRkIHRoZQo+IFZIT1NUX0lPVExCX0lOVkFMSURBVEUgdG8gZ2V0IHZob3N0X3ZkcGFf
YXMsIHRoZSBwcm9jZXNzIGlzIHRoZQo+IHNhbWUgYXMgVkhPU1RfSU9UTEJfVVBEQVRFCj4KPiBT
aWduZWQtb2ZmLWJ5OiBDaW5keSBMdSA8bHVsdUByZWRoYXQuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L3Zob3N0L3ZkcGEuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYyBiL2RyaXZlcnMvdmhvc3QvdmRwYS5j
Cj4gaW5kZXggN2JlOWQ5ZDhmMDFjLi4zMjYzNmEwMmEwYWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy92aG9zdC92ZHBhLmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+IEBAIC0xMDc0LDYg
KzEwNzQsNyBAQCBzdGF0aWMgaW50IHZob3N0X3ZkcGFfcHJvY2Vzc19pb3RsYl9tc2coc3RydWN0
IHZob3N0X2RldiAqZGV2LCB1MzIgYXNpZCwKPiAgICAgICAgICAgICAgICAgZ290byB1bmxvY2s7
Cj4KPiAgICAgICAgIGlmIChtc2ctPnR5cGUgPT0gVkhPU1RfSU9UTEJfVVBEQVRFIHx8Cj4gKyAg
ICAgICAgICAgbXNnLT50eXBlID09IFZIT1NUX0lPVExCX0lOVkFMSURBVEUgfHwKCkknbSBub3Qg
c3VyZSBJIGdldCBoZXJlLCBpbnZhbGlkYXRpb24gZG9lc24ndCBuZWVkIHRvIGNyZWF0ZSBhIG5l
dyBBUy4KCk9yIG1heWJlIHlvdSBjYW4gcG9zdCB0aGUgdXNlcnNwYWNlIGNvZGUgdGhhdCBjYW4g
dHJpZ2dlciB0aGlzIGlzc3VlPwoKVGhhbmtzCgo+ICAgICAgICAgICAgIG1zZy0+dHlwZSA9PSBW
SE9TVF9JT1RMQl9CQVRDSF9CRUdJTikgewo+ICAgICAgICAgICAgICAgICBhcyA9IHZob3N0X3Zk
cGFfZmluZF9hbGxvY19hcyh2LCBhc2lkKTsKPiAgICAgICAgICAgICAgICAgaWYgKCFhcykgewo+
IC0tCj4gMi4zNC4zCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
