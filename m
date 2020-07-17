Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D442231E9
	for <lists.virtualization@lfdr.de>; Fri, 17 Jul 2020 06:02:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1049D882F3;
	Fri, 17 Jul 2020 04:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hsuyw36I3v8f; Fri, 17 Jul 2020 04:01:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5CBCB882F2;
	Fri, 17 Jul 2020 04:01:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CE2AC0733;
	Fri, 17 Jul 2020 04:01:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CED6C0733
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 04:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2BF6E882F2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 04:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0dS+1D9CANnB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 04:01:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6D542882F0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 04:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594958515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GnU865a+lrjDGK+CDwUgz8/N+HiB0/YUZTXlDxqFfkc=;
 b=Wh7PIJuFbZzWTP2bmtVXS8sIOTtrGSyhhsRTaP6DKQJdaUMgbg4UKTvpLN0OzjdyJAAKOT
 0BZnE5It8YXEd1GfMqvMjNqjOIXcms0bhCZMiMGFqATVYgcNy2KRcrRKgzI+L4ZlZnmNu0
 tJTVXp8pWZgBao/NCKDWrQwt1CqcDzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-AwkVz91IP9mfwhYFxiVpqg-1; Fri, 17 Jul 2020 00:01:53 -0400
X-MC-Unique: AwkVz91IP9mfwhYFxiVpqg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0BCE1888AB4;
 Fri, 17 Jul 2020 04:01:51 +0000 (UTC)
Received: from [10.72.12.157] (ovpn-12-157.pek2.redhat.com [10.72.12.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EB7D78A59;
 Fri, 17 Jul 2020 04:01:34 +0000 (UTC)
Subject: Re: [PATCH V2 2/6] kvm: detect assigned device via irqbypass manager
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594898629-18790-1-git-send-email-lingshan.zhu@intel.com>
 <1594898629-18790-3-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f8e0ced4-2883-e022-8fd0-1224987ebef1@redhat.com>
Date: Fri, 17 Jul 2020 12:01:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594898629-18790-3-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Ck9uIDIwMjAvNy8xNiDkuIvljYg3OjIzLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gdkRQQSBkZXZp
Y2VzIGhhcyBkZWRpY2F0ZWQgYmFja2VkIGhhcmR3YXJlIGxpa2UKPiBwYXNzdGhyb3VnaC1lZCBk
ZXZpY2VzLiBUaGVuIGl0IGlzIHBvc3NpYmxlIHRvIHNldHVwIGlycQo+IG9mZmxvYWRpbmcgdG8g
dkNQVSBmb3IgdkRQQSBkZXZpY2VzLiBUaHVzIHRoaXMgcGF0Y2ggdHJpZXMgdG8KPiBtYW5pcHVs
YXRlZCBhc3NpZ25lZCBkZXZpY2UgY291bnRlcnMgdmlhIGlycWJ5cGFzcyBtYW5hZ2VyLgoKClRo
aXMgcGFydCBuZWVkcyBzb21lIHR3ZWFrLCBlLmcgd2h5IGFzc2lnbmVkIGRldmljZSBjb3VsZCBi
ZSBkZXRlY3RlZCAKdGhyb3VnaCB0aGlzIHdheS4KCgo+Cj4gV2Ugd2lsbCBpbmNyZWFzZS9kZWNy
ZWFzZSB0aGUgYXNzaWduZWQgZGV2aWNlIGNvdW50ZXIgaW4ga3ZtL3g4Ni4KCgpBbmQgeW91IG5l
ZWQgZXhwbGFpbiB3aHkgd2UgZG9uJ3QgbmVlZCBzaW1pbGFyIHRoaW5nIGluIG90aGVyIGFyY2gu
CgpUaGFua3MKCgo+IEJvdGggdkRQQSBhbmQgVkZJTyB3b3VsZCBnbyB0aHJvdWdoIHRoaXMgY29k
ZSBwYXRoLgo+Cj4gVGhpcyBjb2RlIHBhdGggb25seSBhZmZlY3QgeDg2IGZvciBub3cuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+Cj4gU3Vn
Z2VzdGVkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IC0tLQo+ICAgYXJj
aC94ODYva3ZtL3g4Ni5jIHwgMTAgKysrKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0v
eDg2LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMKPiBpbmRleCAwMGM4OGMyLi4yMGMwN2QzIDEwMDY0
NAo+IC0tLSBhL2FyY2gveDg2L2t2bS94ODYuYwo+ICsrKyBiL2FyY2gveDg2L2t2bS94ODYuYwo+
IEBAIC0xMDYyNCwxMSArMTA2MjQsMTcgQEAgaW50IGt2bV9hcmNoX2lycV9ieXBhc3NfYWRkX3By
b2R1Y2VyKHN0cnVjdCBpcnFfYnlwYXNzX2NvbnN1bWVyICpjb25zLAo+ICAgewo+ICAgCXN0cnVj
dCBrdm1fa2VybmVsX2lycWZkICppcnFmZCA9Cj4gICAJCWNvbnRhaW5lcl9vZihjb25zLCBzdHJ1
Y3Qga3ZtX2tlcm5lbF9pcnFmZCwgY29uc3VtZXIpOwo+ICsJaW50IHJldDsKPiAgIAo+ICAgCWly
cWZkLT5wcm9kdWNlciA9IHByb2Q7Cj4gKwlrdm1fYXJjaF9zdGFydF9hc3NpZ25tZW50KGlycWZk
LT5rdm0pOwo+ICsJcmV0ID0ga3ZtX3g4Nl9vcHMudXBkYXRlX3BpX2lydGUoaXJxZmQtPmt2bSwK
PiArCQkJCQkgcHJvZC0+aXJxLCBpcnFmZC0+Z3NpLCAxKTsKPiArCj4gKwlpZiAocmV0KQo+ICsJ
CWt2bV9hcmNoX2VuZF9hc3NpZ25tZW50KGlycWZkLT5rdm0pOwo+ICAgCj4gLQlyZXR1cm4ga3Zt
X3g4Nl9vcHMudXBkYXRlX3BpX2lydGUoaXJxZmQtPmt2bSwKPiAtCQkJCQkgICBwcm9kLT5pcnEs
IGlycWZkLT5nc2ksIDEpOwo+ICsJcmV0dXJuIHJldDsKPiAgIH0KPiAgIAo+ICAgdm9pZCBrdm1f
YXJjaF9pcnFfYnlwYXNzX2RlbF9wcm9kdWNlcihzdHJ1Y3QgaXJxX2J5cGFzc19jb25zdW1lciAq
Y29ucywKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
