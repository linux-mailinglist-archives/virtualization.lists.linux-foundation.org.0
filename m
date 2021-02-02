Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B97A330BC1C
	for <lists.virtualization@lfdr.de>; Tue,  2 Feb 2021 11:35:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 66F6F86C7A;
	Tue,  2 Feb 2021 10:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g0ueuioR9X24; Tue,  2 Feb 2021 10:35:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E30DC86C94;
	Tue,  2 Feb 2021 10:35:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BECE3C0FA7;
	Tue,  2 Feb 2021 10:35:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 348B9C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 10:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2E8A886650
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 10:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gn9fB-ZGb+HQ
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 10:35:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 010218651C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 10:35:37 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B60192af90002>; Tue, 02 Feb 2021 02:35:37 -0800
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 2 Feb 2021 10:35:36 +0000
From: Parav Pandit <parav@nvidia.com>
To: <virtualization@lists.linux-foundation.org>, <netdev@vger.kernel.org>,
 <dsahern@gmail.com>, <stephen@networkplumber.org>, <mst@redhat.com>,
 <jasowang@redhat.com>
Subject: [PATCH iproute2-next v3 2/5] utils: Add helper routines for indent
 handling
Date: Tue, 2 Feb 2021 12:35:15 +0200
Message-ID: <20210202103518.3858-3-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210202103518.3858-1-parav@nvidia.com>
References: <20210122112654.9593-3-parav@nvidia.com>
 <20210202103518.3858-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612262137; bh=HDT133gXudxB52omx1TuwZ9j1XEiBgbv7aS9W5cuFWc=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=F0kHY59seyuMIo83PNO700wEQKWx/LGg2pWsTnPsgm2xuLlGaZiY8lopzEdksj28v
 JqSQNS0+0u4IFyjuPICUZ868WR1AjbZtzSeLwESS1tcY313aHvoN3J6Iynrrpm0Ols
 b2V7uFKTK/B5p3rc6Xrcz5T0VVCAHefePb1F24oUhZet7iUqVFu2wpEu8rt2XIG5/w
 l/J5ypU9osePvD9H+2AEU7U2nlWgcXIxIYBLfWDEvnsa94yUvbpOGQke8O8BWaaO8H
 HX2XoUkQPxpPJYpt9oij3Fhlznm47GPdaGungMX+ARRQH8Xy4bC41poY3rM6Xasl9x
 d26ApxyZeeHyA==
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

Subsequent patch needs to use 2 char indentation for nested objects.
Hence introduce a generic helpers to allocate, deallocate, increment,
decrement and to print indent block.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v2->v3:
 - patch split from vdpa tool patch
---
 include/utils.h | 16 ++++++++++++
 lib/utils.c     | 66 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/include/utils.h b/include/utils.h
index e66090ae..9b76c92a 100644
--- a/include/utils.h
+++ b/include/utils.h
@@ -349,4 +349,20 @@ int str_map_lookup_str(const struct str_num_map *map, const char *needle);
 const char *str_map_lookup_u16(const struct str_num_map *map, uint16_t val);
 const char *str_map_lookup_u8(const struct str_num_map *map, uint8_t val);
 
+unsigned int get_str_char_count(const char *str, int match);
+int str_split_by_char(char *str, char **before, char **after, int match);
+
+#define INDENT_STR_MAXLEN 32
+
+struct indent_mem {
+	int indent_level;
+	char indent_str[INDENT_STR_MAXLEN + 1];
+};
+
+struct indent_mem *alloc_indent_mem(void);
+void free_indent_mem(struct indent_mem *mem);
+void inc_indent(struct indent_mem *mem);
+void dec_indent(struct indent_mem *mem);
+void print_indent(struct indent_mem *mem);
+
 #endif /* __UTILS_H__ */
diff --git a/lib/utils.c b/lib/utils.c
index af1b553c..cc6d0e34 100644
--- a/lib/utils.c
+++ b/lib/utils.c
@@ -1978,3 +1978,69 @@ const char *str_map_lookup_u8(const struct str_num_map *map, uint8_t val)
 	}
 	return NULL;
 }
+
+unsigned int get_str_char_count(const char *str, int match)
+{
+	unsigned int count = 0;
+	const char *pos = str;
+
+	while ((pos = strchr(pos, match))) {
+		count++;
+		pos++;
+	}
+	return count;
+}
+
+int str_split_by_char(char *str, char **before, char **after, int match)
+{
+	char *slash;
+
+	slash = strrchr(str, match);
+	if (!slash)
+		return -EINVAL;
+	*slash = '\0';
+	*before = str;
+	*after = slash + 1;
+	return 0;
+}
+
+struct indent_mem *alloc_indent_mem(void)
+{
+	struct indent_mem *mem = malloc(sizeof(*mem));
+
+	if (!mem)
+		return NULL;
+	strcpy(mem->indent_str, "");
+	mem->indent_level = 0;
+	return mem;
+}
+
+void free_indent_mem(struct indent_mem *mem)
+{
+	free(mem);
+}
+
+#define INDENT_STR_STEP 2
+
+void inc_indent(struct indent_mem *mem)
+{
+	if (mem->indent_level + INDENT_STR_STEP > INDENT_STR_MAXLEN)
+		return;
+	mem->indent_level += INDENT_STR_STEP;
+	memset(mem->indent_str, ' ', sizeof(mem->indent_str));
+	mem->indent_str[mem->indent_level] = '\0';
+}
+
+void dec_indent(struct indent_mem *mem)
+{
+	if (mem->indent_level - INDENT_STR_STEP < 0)
+		return;
+	mem->indent_level -= INDENT_STR_STEP;
+	mem->indent_str[mem->indent_level] = '\0';
+}
+
+void print_indent(struct indent_mem *mem)
+{
+	if (mem->indent_level)
+		printf("%s", mem->indent_str);
+}
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
