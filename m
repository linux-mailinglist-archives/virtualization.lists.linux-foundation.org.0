Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8D81CA06E
	for <lists.virtualization@lfdr.de>; Fri,  8 May 2020 03:59:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 99FF787BC0;
	Fri,  8 May 2020 01:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCHkxdFZPRLN; Fri,  8 May 2020 01:59:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1867B87A87;
	Fri,  8 May 2020 01:59:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDFC2C07FF;
	Fri,  8 May 2020 01:59:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A40D0C07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 858D488531
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bEakm3D+mpwF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:59:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 893628852E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588903183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMn5kXEMwwk6mUv6PTZwumoxAF7POIcplX3ZxztB3/w=;
 b=E4TVMuBhItj+lmZEpOm8e/h3ystQ7Q0+Qp8oA9sZzKLP13YuyYzCeClnQ2HkzJCwB+Qj7l
 Yu5PXl4gXrP+67PumGouG39L3aF2hd4hGQkVoVY4Ww73uCmxwYfkhFWw2CaSdZwsZDYRvZ
 E8keP2HMUvHSmiBvE/CQvBpPctV6mxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-3y5hWrAsPU-uIiXsi-giRw-1; Thu, 07 May 2020 21:59:41 -0400
X-MC-Unique: 3y5hWrAsPU-uIiXsi-giRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DCBE80B72B;
 Fri,  8 May 2020 01:59:40 +0000 (UTC)
Received: from [10.72.13.98] (ovpn-13-98.pek2.redhat.com [10.72.13.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4300E579AD;
 Fri,  8 May 2020 01:59:31 +0000 (UTC)
Subject: Re: [PATCH net-next 1/2] virtio-net: don't reserve space for vnet
 header for XDP
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200506061633.16327-1-jasowang@redhat.com>
 <20200506102123.739f1233@carbon>
 <3ecb558b-5281-2497-db3c-6aae7d7f882b@redhat.com>
 <20200506054619-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e1b67a0a-8499-39f9-0132-2ea62205289e@redhat.com>
Date: Fri, 8 May 2020 09:59:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506054619-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, "Jubran,
 Samih" <sameehj@amazon.com>, bpf@vger.kernel.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNS82IOS4i+WNiDU6NDYsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+IFRo
ZXJlCj4+PiBhcmUgYSBsb3Qgb2YgdW5hbnN3ZXJlZCBxdWVzdGlvbnMgb24gaG93IHRoaXMgd2ls
bCBiZSBpbXBsZW1lbnRlZC4KPj4+IFRodXMsIEkgY2Fubm90IGxheW91dCBob3cgd2UgYXJlIGdv
aW5nIHRvIGxldmVyYWdlIHRoaXMgaW5mbyB5ZXQsIGJ1dAo+Pj4geW91ciBwYXRjaCBhcmUga2ls
bGluZyB0aGlzIGluZm8sIHdoaWNoIElITU8gaXMgZ29pbmcgaW4gdGhlIHdyb25nCj4+PiBkaXJl
Y3Rpb24uCj4+IEkgY2FuIGNvcHkgdm5ldCBoZWFkZXIgYWhlYWQgb2YgZGF0YV9oYXJkX3N0YXJ0
LCBkb2VzIGl0IHdvcmsgZm9yIHlvdT8KPj4KPj4gVGhhbmtzCj4gVGhhdCdzIGxpa2VseSB0byBi
ZSBzb21ld2hhdCBleHBlbnNpdmUuCgoKQW55IGJldHRlciBhcHByb2FjaD8gTm90ZSB0aGF0IGl0
J3Mgbm90IHRoZSBpc3N1ZSB0aGF0IGlzIGludHJvZHVjZWQgaW4gCnRoaXMgcGF0Y2guIEFueWhv
dyB0aGUgaGVhZGVyIGFkanVzdG1lbnQgbWF5IGp1c3Qgb3ZlcndyaXRlIHRoZSB2bmV0IApoZWFk
ZXIgZXZlbiB3aXRob3V0IHRoaXMgcGF0Y2guCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
