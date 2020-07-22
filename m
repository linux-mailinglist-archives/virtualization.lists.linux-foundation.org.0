Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ED1229CA4
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:02:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 28BC38877D;
	Wed, 22 Jul 2020 16:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6imlnO7OwN0g; Wed, 22 Jul 2020 16:02:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E1EFD888AC;
	Wed, 22 Jul 2020 16:01:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7FFAC004C;
	Wed, 22 Jul 2020 16:01:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2E50C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B1AAA86CA6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QtCZn4D3KSUi
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9937886BCC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 A7F69305D76C; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 9DD4D305FFA8;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 21/34] KVM: VMX: Define EPT suppress #VE bit (bit 63 in
 EPT leaf entries)
Date: Wed, 22 Jul 2020 19:01:08 +0300
Message-Id: <20200722160121.9601-22-alazar@bitdefender.com>
In-Reply-To: <20200722160121.9601-1-alazar@bitdefender.com>
References: <20200722160121.9601-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

RnJvbTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vhbi5qLmNocmlzdG9waGVyc29uQGludGVsLmNv
bT4KClZNWCBwcm92aWRlcyBhIGNhcGFiaWxpdHkgdGhhdCBhbGxvd3MgRVBUIHZpb2xhdGlvbnMg
dG8gYmUgcmVmbGVjdGVkCmludG8gdGhlIGd1ZXN0IGFzIFZpcnR1YWxpemF0aW9uIEV4Y2VwdGlv
bnMgKCNWRSkuICBUaGUgcHJpbWFyeSB1c2UgY2FzZQpvZiBFUFQgdmlvbGF0aW9uICNWRXMgaXMg
dG8gaW1wcm92ZSB0aGUgcGVyZm9ybWFuY2Ugb2YgdmlydHVhbGl6YXRpb24tCmJhc2VkIHNlY3Vy
aXR5IHNvbHV0aW9ucywgZS5nLiBlbGltaW5hdGUgYSBWTS1FeGl0IC0+IFZNLUV4aXQgcm91bmR0
cmlwCndoZW4gdXRpbGl6aW5nIEVQVCB0byBwcm90ZWN0IHByaXZlbGVnZWQgZGF0YSBzdHJ1Y3R1
cmVzIG9yIGNvZGUuCgpUaGUgIlN1cHByZXNzICNWRSIgYml0IGFsbG93cyBhIFZNTSB0byBvcHQt
b3V0IG9mIEVQVCB2aW9sYXRpb24gI1ZFcyBvbgphIHBlciBwYWdlIGJhc2lzLCBlLmcuIHdoZW4g
YSBwYWdlIGlzIG1hcmtlZCBub3QtcHJlc2VudCBkdWUgdG8gbGF6eQppbnN0YWxsYXRpb24gb3Ig
aXMgd3JpdGUtcHJvdGVjdGVkIGZvciBkaXJ0eSBwYWdlIGxvZ2dpbmcuCgpUaGUgIlN1cHByZXNz
ICNWRSIgYml0IGlzIGlnbm9yZWQ6CgogIC0gQnkgaGFyZHdhcmUgdGhhdCBkb2VzIG5vdCBzdXBw
b3J0IEVQVCB2aW9sYXRpb24gI1ZFcwogIC0gV2hlbiB0aGUgRVBUIHZpb2xhdGlvbiAjVkUgVk1D
UyBjb250cm9sIGlzIGRpc2FibGVkCiAgLSBPbiBub24tbGVhZiBFUFQgZW50cmllcwoKU2lnbmVk
LW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vhbi5qLmNocmlzdG9waGVyc29uQGludGVs
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIu
Y29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL3ZteC5oIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92bXgu
aCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3ZteC5oCmluZGV4IDE3NzUwMGU5ZTY4Yy4uODA4MjE1
OGUzZTk2IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92bXguaAorKysgYi9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS92bXguaApAQCAtNDk4LDYgKzQ5OCw3IEBAIGVudW0gdm1jc19maWVs
ZCB7CiAjZGVmaW5lIFZNWF9FUFRfSVBBVF9CSVQgICAgCQkJKDF1bGwgPDwgNikKICNkZWZpbmUg
Vk1YX0VQVF9BQ0NFU1NfQklUCQkJKDF1bGwgPDwgOCkKICNkZWZpbmUgVk1YX0VQVF9ESVJUWV9C
SVQJCQkoMXVsbCA8PCA5KQorI2RlZmluZSBWTVhfRVBUX1NVUFBSRVNTX1ZFX0JJVAkJCSgxdWxs
IDw8IDYzKQogI2RlZmluZSBWTVhfRVBUX1JXWF9NQVNLICAgICAgICAgICAgICAgICAgICAgICAg
KFZNWF9FUFRfUkVBREFCTEVfTUFTSyB8ICAgICAgIFwKIAkJCQkJCSBWTVhfRVBUX1dSSVRBQkxF
X01BU0sgfCAgICAgICBcCiAJCQkJCQkgVk1YX0VQVF9FWEVDVVRBQkxFX01BU0spCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
