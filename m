Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 601131E9D5B
	for <lists.virtualization@lfdr.de>; Mon,  1 Jun 2020 07:37:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1149D89727;
	Mon,  1 Jun 2020 05:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WjoWQdQ2wnbS; Mon,  1 Jun 2020 05:37:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E8888968B;
	Mon,  1 Jun 2020 05:37:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4530EC088D;
	Mon,  1 Jun 2020 05:37:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45DF3C0176
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 05:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3654988A2D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 05:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbuwU0AwoRA9
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 05:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 986EF88A1F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 05:26:39 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ed491390000>; Sun, 31 May 2020 22:25:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 31 May 2020 22:26:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 31 May 2020 22:26:39 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 1 Jun
 2020 05:26:39 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 1 Jun 2020 05:26:38 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.56.10]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ed4918d0001>; Sun, 31 May 2020 22:26:38 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 1/2] docs: mm/gup: pin_user_pages.rst: add a "case 5"
Date: Sun, 31 May 2020 22:26:32 -0700
Message-ID: <20200601052633.853874-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200601052633.853874-1-jhubbard@nvidia.com>
References: <20200601052633.853874-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590989113; bh=t7FWcHHh76dL2ntq5uEZcJXrRdIPUbkPCP1hpf5ZyJs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=qK1j9GFqbfQmVpQy1H0RYKNlXRO1BkoJ29m7kmpMnNPQuUtvQfBwg2vMMsSvFveYZ
 B4RJF6yYzDWJPbA+0xaMNCl5pIiwE9zxqS3DmytXMMVogrqpR6QR5ifPBK/4OdqkAx
 5sQJ9sxAAQ3GrAOxexuMi6vvC13lWsy/ISJCnIhPlJoIMi/2csU1MFDnTggQ4T94oK
 Tod2zq/E8lTiWlfYGrPfl+Wiu7+lAkY4xGFHT6UWkLNH8s/BwSkflVnW/N7ALhfKyH
 hwASUzab4eDY3/262l16OFARt1OWnabnYoH3Ab53hs03ClSVHIf+sK0Fj9TGdPcb8l
 GptD7xNG4tqcw==
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
bl91c2VyX3BhZ2VzLnJzdCB8IDE4ICsrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2NvcmUtYXBpL3Bp
bl91c2VyX3BhZ2VzLnJzdCBiL0RvY3VtZW50YXRpb24vY29yZS1hcGkvcGluX3VzZXJfcGFnZXMu
cnN0CmluZGV4IDQ2NzViMDRlODgyOS4uNjA2ODI2NmRkMzAzIDEwMDY0NAotLS0gYS9Eb2N1bWVu
dGF0aW9uL2NvcmUtYXBpL3Bpbl91c2VyX3BhZ2VzLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2Nv
cmUtYXBpL3Bpbl91c2VyX3BhZ2VzLnJzdApAQCAtMTcxLDYgKzE3MSwyNCBAQCBJZiBvbmx5IHN0
cnVjdCBwYWdlIGRhdGEgKGFzIG9wcG9zZWQgdG8gdGhlIGFjdHVhbCBtZW1vcnkgY29udGVudHMg
dGhhdCBhIHBhZ2UKIGlzIHRyYWNraW5nKSBpcyBhZmZlY3RlZCwgdGhlbiBub3JtYWwgR1VQIGNh
bGxzIGFyZSBzdWZmaWNpZW50LCBhbmQgbmVpdGhlciBmbGFnCiBuZWVkcyB0byBiZSBzZXQuCiAK
K0NBU0UgNTogUGlubmluZyBpbiBvcmRlciB0byB3cml0ZSB0byB0aGUgZGF0YSB3aXRoaW4gdGhl
IHBhZ2UKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KK0V2ZW4gdGhvdWdoIG5laXRoZXIgRE1BIG5vciBEaXJlY3QgSU8gaXMgaW52
b2x2ZWQsIGp1c3QgYSBzaW1wbGUgY2FzZSBvZiAicGluLAord3JpdGUgdG8gYSBwYWdlJ3MgZGF0
YSwgdW5waW4iIGNhbiBjYXVzZSBhIHByb2JsZW0uIENhc2UgNSBtYXkgYmUgY29uc2lkZXJlZCBh
CitzdXBlcnNldCBvZiBDYXNlIDEsIHBsdXMgQ2FzZSAyLCBwbHVzIGFueXRoaW5nIHRoYXQgaW52
b2tlcyB0aGF0IHBhdHRlcm4uIEluCitvdGhlciB3b3JkcywgaWYgdGhlIGNvZGUgaXMgbmVpdGhl
ciBDYXNlIDEgbm9yIENhc2UgMiwgaXQgbWF5IHN0aWxsIHJlcXVpcmUKK0ZPTExfUElOLCBmb3Ig
cGF0dGVybnMgbGlrZSB0aGlzOgorCitDb3JyZWN0ICh1c2VzIEZPTExfUElOIGNhbGxzKToKKyAg
ICBwaW5fdXNlcl9wYWdlcygpCisgICAgd3JpdGUgdG8gdGhlIGRhdGEgd2l0aGluIHRoZSBwYWdl
cworICAgIHVucGluX3VzZXJfcGFnZXMoKQorCitJTkNPUlJFQ1QgKHVzZXMgRk9MTF9HRVQgY2Fs
bHMpOgorICAgIGdldF91c2VyX3BhZ2VzKCkKKyAgICB3cml0ZSB0byB0aGUgZGF0YSB3aXRoaW4g
dGhlIHBhZ2VzCisgICAgcHV0X3BhZ2UoKQorCiBwYWdlX21heWJlX2RtYV9waW5uZWQoKTogdGhl
IHdob2xlIHBvaW50IG9mIHBpbm5pbmcKID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
