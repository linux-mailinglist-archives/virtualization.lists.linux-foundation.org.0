Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1387922A66F
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 06:20:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8D94488AF5;
	Thu, 23 Jul 2020 04:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hrgWCIzTHnP; Thu, 23 Jul 2020 04:20:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C463B88AEF;
	Thu, 23 Jul 2020 04:20:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F7E7C004C;
	Thu, 23 Jul 2020 04:20:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7372EC004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 04:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6F77288AEF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 04:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dKq+ODPtUZdw
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 04:20:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 24AA688AAC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 04:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595477998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9eSYwQ7URF4XR6sMcM6IEzD2UsZRflT6r9H22UCBNEQ=;
 b=WZWPmx0AQ5acD5yvn5H96VTC0RJIbwi5jGlVj1gZLrF0RegLMTLw0s0X4Dkgij0Yn8aIRC
 pvELlskzg7YlIwu7SMCZT5XdtTKIguKbxFTKzhRCgcdSDg/8Nun23PcLnXkS7DFoqCkf6q
 AYQpf9xoJVoc63W7RfWD+vPNfc5EAuQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-1rwufoNOPpqTclCp-AlzPA-1; Thu, 23 Jul 2020 00:19:53 -0400
X-MC-Unique: 1rwufoNOPpqTclCp-AlzPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69FF8800464;
 Thu, 23 Jul 2020 04:19:52 +0000 (UTC)
Received: from [10.72.13.141] (ovpn-13-141.pek2.redhat.com [10.72.13.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2ABB71D25;
 Thu, 23 Jul 2020 04:19:43 +0000 (UTC)
Subject: Re: [PATCH V3 3/6] vDPA: implement vq IRQ allocate/free helpers in
 vDPA core
To: Zhu Lingshan <lingshan.zhu@intel.com>, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, sean.j.christopherson@intel.com,
 wanpengli@tencent.com
References: <20200722100859.221669-1-lingshan.zhu@intel.com>
 <20200722100859.221669-4-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a3c05c65-74bf-6250-5f4a-3b6cf60f4474@redhat.com>
Date: Thu, 23 Jul 2020 12:19:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722100859.221669-4-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNy8yMiDkuIvljYg2OjA4LCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gKy8qCj4gKyAq
IFJlcXVlc3QgaXJxIGZvciBhIHZxLCBzZXR1cCBpcnEgb2ZmbG9hZGluZyBpZiBpdHMgYSB2aG9z
dF92ZHBhIHZxLgo+ICsgKiBUaGlzIGZ1bmN0aW9uIHNob3VsZCBiZSBvbmx5IGNhbGxlZCB0aHJv
dWdoIHNldHRpbmcgdmlydGlvIERSSVZFUl9PSy4KPiArICogSWYgeW91IHdhbnQgdG8gcmVxdWVz
dCBpcnEgZHVyaW5nIHByb2JlLCB5b3Ugc2hvdWxkIHVzZSByYXcgQVBJcwo+ICsgKiBsaWtlIHJl
cXVlc3RfaXJxKCkgb3IgZGV2bV9yZXF1ZXN0X2lycSgpLgoKClRoaXMgbWFrZXMgdGhlIEFQSSBs
ZXNzIGZsZXhpYmlsZS4gVGhlIHJlYXNvbiBpcyB3ZSBzdG9yZSB0aGUgaXJxIGluIAp2aG9zdC12
ZHBhIG5vdCB2RFBBLgoKSSB3b25kZXIgd2hldGhlciB0aGUgZm9sbG93aW5nIGxvb2tzIGJldHRl
cjoKCjEpIHN0b3JlIGlycSBpbiB2ZHBhIGRldmljZQoyKSByZWdpc3RlciBwcm9kdWNlciB3aGVu
IERSSVZFUl9PSyBhbmQgdW5yZWdpc3RlciBwcm9kdWNlciB3aGVuIAohRFJJVkVSX09LIGluIHZo
b3N0LXZEUEEKMykgZGVhbCB3aXRoIHRoZSBzeW5jaHJvbml6YXRpb24gd2l0aCBTRVRfVlJJTkdf
Q0FMTAo0KSBkb2N1bWVudCB0aGF0IGlycSBpcyBub3QgZXhwZWN0ZWQgdG8gYmUgY2hhbmdlZCBk
dXJpbmcgRFJJVkVSX09LCgpUaGlzIGNhbiBtYWtlIHN1cmUgdGhlIEFQSSB3b3JrcyBkdXJpbmcg
ZHJpdmVyIHByb2JlLCBhbmQgd2UgZG9uJ3QgbmVlZCAKdGhlIHNldHVwX2lycSBhbmQgdW5zZXR1
cF9pcnEgbWV0aG9kIGluIHZkcGFfZHJpdmVyCgpUaGFua3MKCgo+ICsgKi8KPiAraW50IHZkcGFf
ZGV2bV9yZXF1ZXN0X2lycShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCB2ZHBhX2RldmljZSAq
dmRldiwKPiArCQkJICB1bnNpZ25lZCBpbnQgaXJxLCBpcnFfaGFuZGxlcl90IGhhbmRsZXIsCj4g
KwkJCSAgdW5zaWduZWQgbG9uZyBpcnFmbGFncywgY29uc3QgY2hhciAqZGV2bmFtZSwgdm9pZCAq
ZGV2X2lkLAo+ICsJCQkgIGludCBxaWQpCj4gK3sKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0g
ZGV2bV9yZXF1ZXN0X2lycShkZXYsIGlycSwgaGFuZGxlciwgaXJxZmxhZ3MsIGRldm5hbWUsIGRl
dl9pZCk7Cj4gKwlpZiAocmV0KQo+ICsJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHJlcXVlc3Qg
aXJxIGZvciB2cSAlZFxuIiwgcWlkKTsKPiArCWVsc2UKPiArCQl2ZHBhX3NldHVwX2lycSh2ZGV2
LCBxaWQsIGlycSk7Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiArCj4gK30KPiArRVhQT1JUX1NZTUJP
TF9HUEwodmRwYV9kZXZtX3JlcXVlc3RfaXJxKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
