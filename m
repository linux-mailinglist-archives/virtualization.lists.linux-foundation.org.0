Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D0E1978C1
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:19:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE80F86AA4;
	Mon, 30 Mar 2020 10:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRVwPLAwdgW9; Mon, 30 Mar 2020 10:19:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 499E086A54;
	Mon, 30 Mar 2020 10:19:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2572FC07FF;
	Mon, 30 Mar 2020 10:19:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B80FC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F07DF8843F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zoPhzoE0dX1T
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6810488437
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:50 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 8533D3074B71; Mon, 30 Mar 2020 13:12:54 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 528F0305B7A2;
 Mon, 30 Mar 2020 13:12:54 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 37/81] KVM: x86: disable gpa_available optimization for
 fetch and page-walk NPF/EPT violations
Date: Mon, 30 Mar 2020 13:12:24 +0300
Message-Id: <20200330101308.21702-38-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Mircea=20C=C3=AErjaliu?= <mcirjaliu@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
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

RnJvbTogTWlyY2VhIEPDrnJqYWxpdSA8bWNpcmphbGl1QGJpdGRlZmVuZGVyLmNvbT4KClRoaXMg
Y2hhbmdlIGlzIG5lZWRlZCBiZWNhdXNlIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgY2FuIHdyaXRl
LXByb3RlY3QKZ3Vlc3QgcGFnZSB0YWJsZXMgb3IgZXhlYy1wcm90ZWN0IGhlYXAvc3RhY2sgcGFn
ZXMuCgpTaWduZWQtb2ZmLWJ5OiBNaXJjZWEgQ8OucmphbGl1IDxtY2lyamFsaXVAYml0ZGVmZW5k
ZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRl
ci5jb20+Ci0tLQogYXJjaC94ODYva3ZtL21tdS9tbXUuYyB8IDkgKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2t2bS9tbXUvbW11LmMgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCmluZGV4IDdjNjM2
OGRkYzZhNS4uMzViZTlmMmEyZmM3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vbW11L21tdS5j
CisrKyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKQEAgLTU1MzYsOCArNTUzNiwxMyBAQCBpbnQg
a3ZtX21tdV9wYWdlX2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgY3IyX29yX2dw
YSwgdTY0IGVycm9yX2NvZGUsCiAJaWYgKFdBUk5fT04oIVZBTElEX1BBR0UodmNwdS0+YXJjaC5t
bXUtPnJvb3RfaHBhKSkpCiAJCXJldHVybiBSRVRfUEZfUkVUUlk7CiAKLQkvKiBXaXRoIHNoYWRv
dyBwYWdlIHRhYmxlcywgZmF1bHRfYWRkcmVzcyBjb250YWlucyBhIEdWQSBvciBuR1BBLiAgKi8K
LQlpZiAodmNwdS0+YXJjaC5tbXUtPmRpcmVjdF9tYXApIHsKKwkvKgorCSAqIFdpdGggc2hhZG93
IHBhZ2UgdGFibGVzLCBmYXVsdF9hZGRyZXNzIGNvbnRhaW5zIGEgR1ZBIG9yIG5HUEEuCisJICog
T24gYSBmZXRjaCBmYXVsdCwgZmF1bHRfYWRkcmVzcyBjb250YWlucyB0aGUgaW5zdHJ1Y3Rpb24g
cG9pbnRlci4KKwkgKi8KKwlpZiAodmNwdS0+YXJjaC5tbXUtPmRpcmVjdF9tYXAgJiYKKwkgICAg
bGlrZWx5KCEoZXJyb3JfY29kZSAmIFBGRVJSX0ZFVENIX01BU0spKSAmJgorCSAgICAoZXJyb3Jf
Y29kZSAmIFBGRVJSX0dVRVNUX0ZJTkFMX01BU0spKSB7CiAJCXZjcHUtPmFyY2guZ3BhX2F2YWls
YWJsZSA9IHRydWU7CiAJCXZjcHUtPmFyY2guZ3BhX3ZhbCA9IGNyMl9vcl9ncGE7CiAJfQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
