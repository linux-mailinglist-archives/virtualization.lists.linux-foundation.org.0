Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9211E8C3D
	for <lists.virtualization@lfdr.de>; Sat, 30 May 2020 01:43:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67F14875B6;
	Fri, 29 May 2020 23:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdjMqeJJ3CQT; Fri, 29 May 2020 23:43:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 252C4875C8;
	Fri, 29 May 2020 23:43:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09F5FC07FF;
	Fri, 29 May 2020 23:43:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D10AC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 23:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2C47688524
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 23:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bo66CDwW9-fP
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 23:43:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4D87D88543
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 23:43:12 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ed19db30000>; Fri, 29 May 2020 16:41:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 29 May 2020 16:43:11 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 29 May 2020 16:43:11 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 May
 2020 23:43:11 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 29 May 2020 23:43:11 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.87.173]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ed19e0f0001>; Fri, 29 May 2020 16:43:11 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/2] docs: mm/gup: pin_user_pages.rst: add a "case 5"
Date: Fri, 29 May 2020 16:43:08 -0700
Message-ID: <20200529234309.484480-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529234309.484480-1-jhubbard@nvidia.com>
References: <20200529234309.484480-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590795699; bh=/rPFi6UMeQqIwH0AXw3mk+tI0oUReiPuYz0u4gk+gB4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=aLSQsNOdMWIF0LkIlbgwkwE7Tydi/7c5/ubijb8BcaFTIZEmhASKRET9Pca2eBhxG
 dREVJpcO2ADpj3UkVt0jUxkcnrRTCw4rXg9IKomdo4dQTH1CfYYB8ffwCmWCd9HN3A
 JIWv3bqa+Gg3EHmOTKcmCEuIvUL/VqJY25SULLKbpwSQ6b1XwGVe3sAYTL/Qwlabih
 x607bsQ0F1z2uQFX8AL5YzbsWkdWeUT/F0Jb8Ib1qqB0Pn0XVtAfJaEZQDl8GkPKcN
 TFCHCxL5GeGK/stqfrP64DTXAMPgO0H6TJzbyusWRjhSQfHOqkJ1IE/IVGf3B5XjlI
 4QyQIJBypY8RA==
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Dave Chinner <david@fromorbit.com>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-fsdevel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
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

VGhlcmUgYXJlIGZvdXIgY2FzZXMgbGlzdGVkIGluIHBpbl91c2VyX3BhZ2VzLnJzdC4gVGhlc2Ug
YXJlCmludGVuZGVkIHRvIGhlbHAgZGV2ZWxvcGVycyBmaWd1cmUgb3V0IHdoZXRoZXIgdG8gdXNl
CmdldF91c2VyX3BhZ2VzKigpLCBvciBwaW5fdXNlcl9wYWdlcyooKS4gSG93ZXZlciwgdGhlIGZv
dXIgY2FzZXMKZG8gbm90IGNvdmVyIGFsbCB0aGUgc2l0dWF0aW9ucy4gRm9yIGV4YW1wbGUsIGRy
aXZlcnMvdmhvc3Qvdmhvc3QuYwpoYXMgYSAicGluLCB3cml0ZSB0byBwYWdlLCBzZXQgcGFnZSBk
aXJ0eSwgdW5waW4iIGNhc2UuCgpBZGQgYSBmaWZ0aCBjYXNlLCB0byBoZWxwIGV4cGxhaW4gdGhh
dCB0aGVyZSBpcyBhIGdlbmVyYWwgcGF0dGVybgp0aGF0IHJlcXVpcmVzIHBpbl91c2VyX3BhZ2Vz
KigpIEFQSSBjYWxscy4KCkNjOiBWbGFzdGltaWwgQmFia2EgPHZiYWJrYUBzdXNlLmN6PgpDYzog
SmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRo
YXQuY29tPgpDYzogRGF2ZSBDaGlubmVyIDxkYXZpZEBmcm9tb3JiaXQuY29tPgpDYzogSm9uYXRo
YW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4KQ2M6IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcK
Q2M6IGxpbnV4LWZzZGV2ZWxAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEpvaG4gSHVi
YmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL3Bp
bl91c2VyX3BhZ2VzLnJzdCB8IDIwICsrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vY29yZS1hcGkv
cGluX3VzZXJfcGFnZXMucnN0IGIvRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9waW5fdXNlcl9wYWdl
cy5yc3QKaW5kZXggNDY3NWIwNGU4ODI5Li5iOWYyNjg4YTJjNjcgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vY29yZS1hcGkvcGluX3VzZXJfcGFnZXMucnN0CisrKyBiL0RvY3VtZW50YXRpb24v
Y29yZS1hcGkvcGluX3VzZXJfcGFnZXMucnN0CkBAIC0xNzEsNiArMTcxLDI2IEBAIElmIG9ubHkg
c3RydWN0IHBhZ2UgZGF0YSAoYXMgb3Bwb3NlZCB0byB0aGUgYWN0dWFsIG1lbW9yeSBjb250ZW50
cyB0aGF0IGEgcGFnZQogaXMgdHJhY2tpbmcpIGlzIGFmZmVjdGVkLCB0aGVuIG5vcm1hbCBHVVAg
Y2FsbHMgYXJlIHN1ZmZpY2llbnQsIGFuZCBuZWl0aGVyIGZsYWcKIG5lZWRzIHRvIGJlIHNldC4K
IAorQ0FTRSA1OiBQaW5uaW5nIGluIG9yZGVyIHRvIHdyaXRlIHRvIHRoZSBkYXRhIHdpdGhpbiB0
aGUgcGFnZQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQorRXZlbiB0aG91Z2ggbmVpdGhlciBETUEgbm9yIERpcmVjdCBJTyBpcyBp
bnZvbHZlZCwganVzdCBhIHNpbXBsZSBjYXNlIG9mICJwaW4sCithY2Nlc3MgcGFnZSdzIGRhdGEs
IHVucGluIiBjYW4gY2F1c2UgYSBwcm9ibGVtLiBDYXNlIDUgbWF5IGJlIGNvbnNpZGVyZWQgYQor
c3VwZXJzZXQgb2YgQ2FzZSAxLCBwbHVzIENhc2UgMiwgcGx1cyBhbnl0aGluZyB0aGF0IGludm9r
ZXMgdGhhdCBwYXR0ZXJuLiBJbgorb3RoZXIgd29yZHMsIGlmIHRoZSBjb2RlIGlzIG5laXRoZXIg
Q2FzZSAxIG5vciBDYXNlIDIsIGl0IG1heSBzdGlsbCByZXF1aXJlCitGT0xMX1BJTiwgZm9yIHBh
dHRlcm5zIGxpa2UgdGhpczoKKworQ29ycmVjdCAodXNlcyBGT0xMX1BJTiBjYWxscyk6CisgICAg
cGluX3VzZXJfcGFnZXMoKQorICAgIGFjY2VzcyB0aGUgZGF0YSB3aXRoaW4gdGhlIHBhZ2VzCisg
ICAgc2V0X3BhZ2VfZGlydHlfbG9jaygpCisgICAgdW5waW5fdXNlcl9wYWdlcygpCisKK0lOQ09S
UkVDVCAodXNlcyBGT0xMX0dFVCBjYWxscyk6CisgICAgZ2V0X3VzZXJfcGFnZXMoKQorICAgIGFj
Y2VzcyB0aGUgZGF0YSB3aXRoaW4gdGhlIHBhZ2VzCisgICAgc2V0X3BhZ2VfZGlydHlfbG9jaygp
CisgICAgcHV0X3BhZ2UoKQorCiBwYWdlX21heWJlX2RtYV9waW5uZWQoKTogdGhlIHdob2xlIHBv
aW50IG9mIHBpbm5pbmcKID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
